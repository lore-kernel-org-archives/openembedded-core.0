Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDC96010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:36:11 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id c20so129701768pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to;
	bh=7ERFpT5dm83cZoXmHELiWOE2XsfeNcDcMh18kUTSli8=;
	b=Rv/BoL55po7RITfKkQlvb5Xb/CPmk/L0x8SEBbDyjbQ7+nHS5u52nUYfnwPPgKgWr7
	V+fH8E+d5iUky2fwW/ZfGbWnk3dFWj8eiutvecz3ZH5spF3ZgNE+p0ONFHPmJ+HVfo9B
	FzoZTRiqgdflqv/4lm1W+970B/eHzOg4FKi7wVfhFOs0Sm2aMulp4rPYXBOb3JLqRQHc
	K0EIJWYQMGNVabj/rlaFFXWcEy4r7q8JF4a9x+zrNsCotZAJ94rfTNjq3osX0LzyyIdq
	jNucCNl4dcxbSdBE7pDby7RQ19/Z++46N+LwJy5UaIMB6YpGAQJoSBqz055z3ufJVQOI
	/WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=7ERFpT5dm83cZoXmHELiWOE2XsfeNcDcMh18kUTSli8=;
	b=DunVI3Xj6KsPe9gYcjYzhS5BEDALdmT7Ls9lCyhBHLiR8FW+o20Zyazt/pl5RdCkAa
	D3Oo8yDlsVEOme5aZbPgGqB0VH7DR6C/FSp+s6gu9s2WR+qdBK+was6Erpa+1Uc0dFly
	m9u7KVMcft5VBEmIvu6gtVZg7aXjSL281X5NXvOSkemT/wny0ONMZw8jUUVdfJlcrBPm
	6Kri6wj5h0CkoyTZQHR7xbsgkasUJcu4/8tW89vwNoufQx3u2lu04sPgyPJn319J9VDJ
	sAUhiFPcXypnveYqStgo9LsGtvH0MdHVlDrxpQtyDnUs7TVHfY3lCE3xcE3RgIEQEql6
	6Y6Q==
X-Gm-Message-State: AD7BkJKA2zljCTuzJwlUpcjLq76654M647WkP7RppqKHE8ZUa3HAFq2aS3VvZISypipmHA==
X-Received: by 10.98.66.155 with SMTP id h27mr34998170pfd.91.1460403372771;
	Mon, 11 Apr 2016 12:36:12 -0700 (PDT)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	u2sm38017957pfi.26.2016.04.11.12.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Apr 2016 12:36:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id e128so129585463pfe.3;
	Mon, 11 Apr 2016 12:36:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.67.139 with SMTP id l11mr35082228pfi.112.1460403370677;
	Mon, 11 Apr 2016 12:36:10 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 11 Apr 2016 12:36:10 -0700 (PDT)
Date: Mon, 11 Apr 2016 16:36:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrY-j+KEjRnggfRwpXXZyCWngNZ7xMkL5=Z5QV0b9R+uQ@mail.gmail.com>
Message-ID: <CAP9ODKrY-j+KEjRnggfRwpXXZyCWngNZ7xMkL5=Z5QV0b9R+uQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [ANN] Yocto Explorer: command line tool to ease the manipulation of files inside Yocto Project based systems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Apr 2016 19:36:13 -0000
Content-Type: text/plain; charset=UTF-8

[ DISCLAIMER: I am posting this here as many people may find it
useful, I would like to apologize in advance for any inconvenience ]

ye[1] is a command line tool to ease the manipulation of files under
the directory structure adopted by O.S. Systems (using repo tool) to
organize projects that use the Yocto Project. ye provides means to
quickly locate files and directories into projects' directory tree,
and act on them.

1. http://code.ossystems.com.br/gitweb?p=apps/ye.git;a=summary
    http://code.ossystems.com.br/p/apps/ye.git

I won't paste the full documentation about the tool as it would flood
people not intending to use it, however there is a fairly complete
documentation in our doc[2] server.

2. http://doc.ossystems.com.br/ye.html

Thanks in advance,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

