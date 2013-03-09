Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UEJFy-0007Z9-D4
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 13:52:11 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so3099226oag.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2013 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=bWbWGvWBh+QNUmfFuykeatntcEuqGAXJ8dqL4EuWheI=;
	b=Xb+BPnE5ZI1R1CASCR+k5SXxHsqh8g7iIj/opJJnapsp+qhDMtXRM8x6Qa9/4+br3E
	dMr0d+mh41MOuTmV59am4wS+dLwK80MtF69/LIAM1mK9NiF1gUemAH+Jbo/2GyF6nHlx
	A0irQSG4SAgxoh4lvkb8O+j7JGaj7/izmcky786ukLotKlICDJ4NYa+lB9bUZdL+dQo+
	6EA4sde+pQSU0kBjRUR2PE92Lmxd2LNgZReCyXRe9Aa1PaDDTt41x5hzwYj+Y5W7U5rN
	IcBA1mZuQx5V1WeDctoDBX+k1t6Sm77GficIgsFKxVchCeAum1qtZTeZuqoYl+tWRArL
	obkw==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr4323995oee.82.1362832535050; Sat,
	09 Mar 2013 04:35:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 9 Mar 2013 04:35:34 -0800 (PST)
In-Reply-To: <1362784987-27907-1-git-send-email-jslater@windriver.com>
References: <1362784987-27907-1-git-send-email-jslater@windriver.com>
Date: Sat, 9 Mar 2013 09:35:34 -0300
X-Google-Sender-Auth: 0u6NvpAlFgKkVEsM5RzERnUNnK4
Message-ID: <CAP9ODKppVNMaFtpDU7G8N9Q-EUZSyPx8D1-9mo8VWG5wvMF16A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzcode & tzdata: update to 2013a versions
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
X-List-Received-Date: Sat, 09 Mar 2013 12:52:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 8, 2013 at 8:23 PM, Joe Slater <jslater@windriver.com> wrote:
> CQID: 407425
>
> Create new tzcode and tzdata recipes for 2013a timezone
> data.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>

Your commit log is confusing: short log say's update, long description
create. Please choose one route ;-) I prefer you to update previous
version to this one and avoid having two of them, except if you see a
good reason to not to do that.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


