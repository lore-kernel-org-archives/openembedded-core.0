Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tb8hd-0005JA-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 12:42:49 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3227511pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+W6Qhs0AmxgSagef/rNczkk+F8oFoky6eWWprWKCNmE=;
	b=Xdrl89auWWl3IT1vkPXhpPAPwcW2pyTnDMS1TqEksLk8VgU1F5lRwMfaJvDR0Si3qy
	Kir1Da+KeTI1j9MyS3ig62KxnHk1lhiQ3YlKdu9XimCDt3yUoOR8iScIQ6Zhw1eyCDi9
	IURQ53j2hWMpETWNmSs/KjZJvhlpdEp6i8uw7T+FFUJtQVsYwBqXigg9rGLH73K8WVqz
	7eFA8ofTYuLEtqLjjDJxJsVKrEmRhwLEDtPrtfccw1V0fh4g/nuvkxlywBbuu1X0wD4o
	4k8Cxw4scTc2Zlok8Ksz1UKJTvHnY+fHW3KQApA5QyLMjOvBSgKXvJ6FnlH4o/GIMXRv
	YYTA==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr16666281pax.43.1353497323170; Wed,
	21 Nov 2012 03:28:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 03:28:43 -0800 (PST)
In-Reply-To: <bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
References: <cover.1353490311.git.kai.kang@windriver.com>
	<bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
Date: Wed, 21 Nov 2012 09:28:43 -0200
X-Google-Sender-Auth: jT0E_ETK1TYAoT4vu22bbbDGRp8
Message-ID: <CAP9ODKoae1cD-qkN=VfSpLDRZO=yrcCXyhEmE+5+ZQbjahpU5w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 4/4] msmtp: add link to ${libdir}/sendmail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 11:42:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 7:38 AM, Kang Kai <kai.kang@windriver.com> wrote:
> LSB tests check file ${libdir}/sendmail, and the file was created by
> package lsbsetup. Because lsbsetup is dropped, create the link in msmtp.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>

I think it is wrong. You should to use alternatives for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


