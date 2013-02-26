Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAQr1-0008Ok-JP
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:10:28 +0100
Received: by mail-oa0-f49.google.com with SMTP id j6so5978899oag.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 11:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=km094DiMnG8ERx28ZFEfizJAKqtcMh2xWouNkWlSdQs=;
	b=GnpHpilBtnlWekkxmpWLLW7Kwpx2QezECG8Q5CxUk29JZObcLo9AZPEi2DryS+n9SP
	WPqolzKZyzQGTlgkgOpSrLLeJB74JXdKi079CCmnKfXjHPx4N9Yvuuh2zV3ER0+/Y+Xb
	Rq8PK+LJmAzcrccXPslZysSlYge2Fyj5d4EWQG8q48Bbvk8Rt8qtPLRkCzB1mFZxDQg0
	6yXHmEQGkyZxrAxUdF7QyOna3x5P5eR9gTo+Qm+hVKPEpH6xbfvdVKkycNU/d8yg9TZA
	DWkDiXd20E1LQxs0bkNTLosUNbjLDZ9CnaDF+T+FMjaLRxgykpqItkaAsoBh1j14InRl
	7Xew==
MIME-Version: 1.0
X-Received: by 10.60.171.102 with SMTP id at6mr2804285oec.60.1361908439162;
	Tue, 26 Feb 2013 11:53:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 11:53:59 -0800 (PST)
In-Reply-To: <CAP9ODKqbNMMA1o0hjRiKn3Sen4F6uAU4kK8VhFK5RvdZixvCxA@mail.gmail.com>
References: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKqbNMMA1o0hjRiKn3Sen4F6uAU4kK8VhFK5RvdZixvCxA@mail.gmail.com>
Date: Tue, 26 Feb 2013 16:53:59 -0300
X-Google-Sender-Auth: YaHETRycs7lkaAfxS2MsiadQ1yQ
Message-ID: <CAP9ODKoHroEZbnjyg5LT_1EzVXKDz2JtRmhX-qMuMUmpzGYUKA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 20:10:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 4:52 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Feb 26, 2013 at 2:53 PM, Ross Burton <ross.burton@intel.com> wrote:
>> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
>> work on the target.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Now I saw the Khem suggestion to use /usr/bin/env kill; seems good.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


