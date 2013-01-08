Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsbtG-00044q-3A
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:19:13 +0100
Received: by mail-ob0-f178.google.com with SMTP id eh20so575858obb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=UwIjCtce+ht6qCxcpcH8Uh2r+2IvuQuqY+1PXT5khWM=;
	b=iKkgSCfZXYpJLyU8e/nDN+s70/pR0pJzxSQ4kbsOhWnW1rdcRGBIIT0ORwOj7b8TKL
	1CcESyPeW7E+tJiGByp/dM9k0OVH39emPX+mlIVSfNYGHhKrdcjJRXbTtslv6+09AB+5
	HGwXkZoFOYPNAT5NvVewM9woEexj1gRfM8fI+rhgz+FL8wnwZ6H7gBbREN7SH/cOEOxv
	4HqvhdkxD36A6axRv8TkJbd48iy2UbBnRLQd2BQU67Pt17lTA0yI+Wvl5qerxvQYzKlr
	MvnhKgfZeJPHmdVTT+mHs0YT/wtck60JfGqfOMPgcs97PNStRTPfVW2+MMJSMQ0uCO+u
	8xEQ==
MIME-Version: 1.0
Received: by 10.60.171.201 with SMTP id aw9mr35926651oec.126.1357661030839;
	Tue, 08 Jan 2013 08:03:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 8 Jan 2013 08:03:50 -0800 (PST)
In-Reply-To: <1357660547-19803-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1357660547-19803-1-git-send-email-muhammad_shakeel@mentor.com>
Date: Tue, 8 Jan 2013 14:03:50 -0200
X-Google-Sender-Auth: fy4Irim8QPeLvKTphI9mB6F5UrA
Message-ID: <CAP9ODKqce52z7FKg2frjMwUEkRzsWRGJ78HQwTatiXR09FugQQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] archive-*-source.bbclass: Use tasks instead of pre/post functions
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
X-List-Received-Date: Tue, 08 Jan 2013 16:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 8, 2013 at 1:55 PM, Shakeel, Muhammad
<muhammad_shakeel@mentor.com> wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> * Modified following archiver related classes to add separate tasks
>   for different archiver functions instead of adding these as pre/post
>   functions of existing tasks.
>     -archive-original-source.bbclass
>     -archive-patched-source.bbclass
>     -archive-configured-source.bbclass
>
> [YOCTO #3449]
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>

This can be dropped as it will be changed again in 3/3. Right?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


