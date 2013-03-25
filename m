Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UKF0q-0006gL-L8
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 22:33:05 +0100
Received: by mail-la0-f47.google.com with SMTP id fj20so12363760lab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zT6oIC3biaFSf2WeyJhQnpqPZY/cFssu1VI8NtWmqYY=;
	b=JQlB788Y44C+ZvCRMoL4Xj2OGQNc4gVu0e4JOhn5Az8cTVO8OFdW09SLMUNY7Xb+2c
	+VopY3PjnAMvpERXNtvNp+iWAJc8mSrFA2Vw1rBbZV31AK8Vo7qPNXb2gFm085HxdlyP
	3GwWpE2/ISY8CVBFV4boqeogRhOExNRRJ6g2Tzsn6mv7uFsIjdx+qpGz5vXrNX1rPVPZ
	GWqYfh7N5951nlXp9wjupZ1rAFONCGt0MYuxoVP/KBXFIa/kuUG5RdvWvh3rkDQa+WXK
	rilohOkb/u7fm8kXDhYGQW0Tax27aAh54YccqGYqjPAzttz6wnBMX3S8RK6cH3X5dyKD
	u54g==
X-Received: by 10.112.30.104 with SMTP id r8mr7008024lbh.82.1364246165745;
	Mon, 25 Mar 2013 14:16:05 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Mon, 25 Mar 2013 14:15:45 -0700 (PDT)
In-Reply-To: <1364244540-29538-1-git-send-email-jslater@windriver.com>
References: <1364244540-29538-1-git-send-email-jslater@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 25 Mar 2013 14:15:45 -0700
X-Google-Sender-Auth: feXUwQ5UP-DAlGaRr4c4GRIFhuk
Message-ID: <CABcZANkaW4BKpqovTC9py1LiRT-d3=n83QoewVKM0PNLsbcC=w@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dosfstools: really compile supporting large files [ Fix: 409915 ]
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
X-List-Received-Date: Mon, 25 Mar 2013 21:33:05 -0000
Content-Type: multipart/alternative; boundary=f46d04016b39187e7004d8c6500a

--f46d04016b39187e7004d8c6500a
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 25, 2013 at 1:49 PM, Joe Slater <jslater@windriver.com> wrote:

> CQID: 409915
>
> Makefile in the package tries to set _FILE_OFFSET_BITS=64,
> but we clobber that with our CFLAGS, so we add it in
> the recipe.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
>

Afaik there is a largefile distro feature, should this use that, through
packageconfig?
-- 
Christopher Larson

--f46d04016b39187e7004d8c6500a
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Mon, Mar 25, 2013 at 1:49 PM, Joe Slater <span dir="ltr">&lt;<a href="mailto:jslater@windriver.com" target="_blank">jslater@windriver.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":29p">CQID: 409915<br>
<br>
Makefile in the package tries to set _FILE_OFFSET_BITS=64,<br>
but we clobber that with our CFLAGS, so we add it in<br>
the recipe.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href="mailto:jslater@windriver.com">jslater@windriver.com</a>&gt;</div></blockquote></div><br>Afaik there is a largefile distro feature, should this use that, through packageconfig?<br>-- <br>

Christopher Larson</div></div>

--f46d04016b39187e7004d8c6500a--
