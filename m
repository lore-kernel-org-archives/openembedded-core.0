Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TjYgR-0002cg-Qu
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:04:23 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1751206bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:content-type
	:x-mailer:mime-version:content-transfer-encoding;
	bh=/kmyeOahczQwOjp2Ld7gbsTUo9z8ScqYXrTZgckRr6M=;
	b=fqy/0v4DRUNahdCR7iU2rZJvBzpdCiyFxca7IWkMZRNVNFopg3MoOFgKOnCE9C6moY
	DBC+nx2HV7P+Q+FMadM7R7v8AyiAiGZILbJz2eYwYGfoIAryZ0108ezV+G1bebAqIyN0
	bJ68gEwSZvKLJUEwpQPbj6RC9N3nYiVXFTOZF1vhGbBOWrCiO3A8KcX5OrvQxWPgbCV5
	EE7gMFGwtDc4RiWqZOhuBG6+xCDA8Ie0Bl9B/Ei62k4xat2WC1oDCK/aJQhoRsLZLdnM
	CF9305j99qTh5/5e1oGKUtAaPg1lRLVe3D+srvtA4AaNWECkiHb6ZX7RDdULZTUH2f29
	/qyQ==
Received: by 10.204.129.202 with SMTP id p10mr3048169bks.56.1355503787524;
	Fri, 14 Dec 2012 08:49:47 -0800 (PST)
Received: from [192.168.1.25] (93-139-163-243.adsl.net.t-com.hr.
	[93.139.163.243])
	by mx.google.com with ESMTPS id l17sm5153786bkw.12.2012.12.14.08.49.44
	(version=SSLv3 cipher=OTHER); Fri, 14 Dec 2012 08:49:46 -0800 (PST)
Message-ID: <1355503781.9104.27.camel@dromedary>
From: Marko =?UTF-8?Q?Kati=C4=87?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 17:49:41 +0100
In-Reply-To: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
X-Mailer: Evolution 3.6.0-0ubuntu3 
Mime-Version: 1.0
Subject: Re: gcc-4.7.inc wrong FILESPATH setting?
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
X-List-Received-Date: Fri, 14 Dec 2012 17:04:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrote:
> Hi All,
>  
> I've seen that, in the given .inc file, the FILESPATH is statically
> set to
>  
> FILESPATH = "${FILE_DIRNAME}/gcc-4.7"
>  
> This seems to avoid any FILESEXTRAPATHS_prepend usage on append file.
> I need to add further patches for gcc-4.7.2 in my own meta layer but
> if I set the FILESEXTRAPATHS_prepend as usual
> nothing happens, sources are taken only from the directory set by
> FILESPATH.
> Also I saw this setting was different in the past
> 
> FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>  
> Comments are welcome.
> Cheers,
> Giuseppe
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

I can confirm this. I also have patches for gcc-4.7.2 in my personal layer and i
also used FILESEXTRAPATHS_prepend in my bbappend files to add them. This used
to work before but now it seems as though FILESEXTRAPATHS_prepend is being
ignored.



