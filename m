Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2937DEA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 12:36:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d18so3222666wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+d8xlEnjbPoy1tTJOJ26oBZLmuf0aB3+OYT+QXxJ8j0=;
	b=JJJm9QFSig+zq2j+/jNssjw7XgiMBGxrirGVB+7UWaAC1DzNcG0mYACJH3TPO+6xVY
	LUMC2ydKTso3TilSs1dNTNnNP4RVCmD6ZqbzBJ4h38Zou6WgD+ASFEBiIxt745W9Q4hw
	+9RFv+bvMw6zoHv68PXwiPTtkLLEvUvtPUEyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+d8xlEnjbPoy1tTJOJ26oBZLmuf0aB3+OYT+QXxJ8j0=;
	b=ZpXJJa3mqoXvNSKS0Ed9qM2qaRQcSnHUyzYYyak5oZUQmJmVjTNjrM0tUH2x/QryuA
	QYTsHCNPBet9yvDxVZF4xPcULgRiVCuYnH4IwTMacnS/FQFa/4XoKQnm51zvOEjeyNQE
	U1sZshGKXqlGseSPNLoI59ypZdKtX2cXQadUym+it2L/daOpOMTa3bspYnFTzK9PWWSv
	z8uYpw5ZvNXg3QceAuFTAn7YJMMWj0GMyRRrAulgsbTXhrb6UaWaRLD1Js9IXEdbMmcS
	Z3eW7YHhHecNhl3Ylz3aUs7OHc3HBedZIc71DMpUvFjyegGM8HolegLRmO8WWYXrxcNw
	Byzw==
X-Gm-Message-State: APjAAAVcrQ+hhfY/p+d3BNhqHLoGivuolPNXsLSgjaMwoOFvZByiW8e4
	GXQ6f0bo4mLEaCupJqLObSUeBhHlYTk=
X-Google-Smtp-Source: APXvYqzB5IcSER+riLvVIrP/ufgFUBkiu2eeyRpzANL6Nufqo7atbWvK/zLD9hW1626wYXX8KVqMbg==
X-Received: by 2002:adf:d089:: with SMTP id y9mr13168631wrh.239.1558010180332; 
	Thu, 16 May 2019 05:36:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g11sm987010wrx.62.2019.05.16.05.36.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 05:36:19 -0700 (PDT)
Message-ID: <6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2019 13:36:18 +0100
In-Reply-To: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: ptest with BBCLASSEXTEND
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
X-List-Received-Date: Thu, 16 May 2019 12:36:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 11:54 +0100, Richard Purdie wrote:
> https://autobuilder.yocto.io/pub/non-release/20190514-14/testresults/testresult-report.txt

A couple of patches (on the list) gets us to the results below which is
better. The perl module failures and quilt are from missing perl module
dependencies.

--------------------------------------------------------------------------------------------------------------
Recipe                       | Passed      | Failed    | Skipped   | Time(s)   
--------------------------------------------------------------------------------------------------------------
acl                          | 3           | 0         | 0         | 0
apr                          | 44          | 0         | 0         | 58
apr-util                     | 19          | 0         | 0         | 8
attr                         | 0           | 0         | 0         | 0
bash                         | 36          | 8         | 0         | 108 T
bluez5                       | 23          | 2         | 0         | 5
busybox                      | 528         | 4         | 76        | 4
bzip2                        | 6           | 0         | 0         | 1
dbus-test                    | 0           | 0         | 0         | 91 T
diffstat                     | 439         | 0         | 0         | 3
diffutils                    | 19          | 0         | 2         | 2
e2fsprogs                    | 0           | 0         | 0         | 108 T
elfutils                     | 172         | 24        | 7         | 20
ethtool                      | 2           | 0         | 0         | 1
flex                         | 114         | 0         | 0         | 2
gawk                         | 342         | 0         | 0         | 2
gdbm                         | 24          | 0         | 0         | 2
gdk-pixbuf                   | 20          | 0         | 0         | 39
gettext                      | 354         | 21        | 37        | 33
glib-2.0                     | 242         | 3         | 0         | 347
gstreamer1.0                 | 103         | 1         | 0         | 104
gzip                         | 19          | 0         | 3         | 4
json-glib                    | 14          | 0         | 0         | 0
kbd                          | 5           | 2         | 0         | 1
libconvert-asn1-perl         | 0           | 22        | 0         | 0
liberror-perl                | 0           | 15        | 0         | 0
libevent                     | 1           | 0         | 0         | 86
libpcre                      | 0           | 0         | 0         | 1
libtest-needs-perl           | 0           | 2         | 0         | 0
libtimedate-perl             | 3           | 2         | 0         | 0
liburi-perl                  | 0           | 39        | 2         | 0
libusb1                      | 4           | 0         | 0         | 6
libxml-namespacesupport-perl | 0           | 1         | 0         | 0
libxml-parser-perl           | 0           | 15        | 0         | 0
libxml-perl                  | 0           | 6         | 0         | 0
libxml-sax-base-perl         | 0           | 19        | 0         | 0
libxml-sax-perl              | 0           | 14        | 0         | 0
libxml-simple-perl           | 0           | 14        | 0         | 0
libxml2                      | 134         | 0         | 0         | 17
lttng-tools                  | 3397        | 626       | 1         | 350 T
lzo                          | 5           | 0         | 0         | 2
m4                           | 144         | 8         | 18        | 5
nettle                       | 97          | 0         | 2         | 9
openssh                      | 0           | 0         | 1         | 1
openssl                      | 146         | 1         | 8         | 91
opkg                         | 0           | 0         | 0         | 11
pango                        | 12          | 0         | 0         | 1
parted                       | 41          | 1         | 22        | 5
perl                         | 2423        | 19        | 238       | 713
python                       | 301         | 6         | 41        | 325
python3                      | 30277       | 2         | 1043      | 990
quilt                        | 0           | 57        | 0         | 0
sed                          | 86          | 0         | 0         | 4
slang                        | 97          | 0         | 0         | 22
strace                       | 466         | 18        | 147       | 176
tcl                          | 149         | 0         | 0         | 179
util-linux                   | 336         | 2         | 80        | 41
valgrind                     | 149         | 1         | 9         | 544
zlib                         | 1           | 0         | 0         | 1

Cheers,

Richard


