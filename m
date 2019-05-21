Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id ADE0E7DF94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:31:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id i3so197406wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=no8XGxoJfWCEf1OwmCamdd8A72KvbtpzN+EN0K0jGiQ=;
	b=bN0Ow3fEhC2ZYOFxQvuX+z3/+UqvLfKecm8q7K9+9c6RF8VKJodVSsxlJuYorSlKN+
	vaVMKMbPFwWf3VgkdJFyj7Uw+w3xUGvVkKKI1PGmANfiyTqgQe5P4ZD4EhFmfM66sHtE
	7eiqKBGNSCjUJFagRWJRoRgFmhuMYXbzqJW/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=no8XGxoJfWCEf1OwmCamdd8A72KvbtpzN+EN0K0jGiQ=;
	b=oVnKinPP1Jyfsa3ugPbR3ODxfPJwWMtS6v1b9l0g2NrHeOk/RKu4dAzgf9bPcme8ZT
	2EzuCCcRrDgxlM+yKcnQMRvuePoMzBHM3nRtyj/Tdctn8ukdGXh9CaxZ3DTVoQd7qT+t
	1KWkexdj9jp1ML3cXpdC71ZCz9pKOCbCnyTsCqXfA+wD0wew/d4/FEGtWEZQVY+48U9T
	BW0EEpfvldkdivhnd6kAqIEw5NBveHSbpLzyZLJ5y+oUBj1/9betwpOqzY5MJuaXpAyU
	TS68YGXHmuPFi8VWLnv/oyUxd344Eitb9V5wUW8G6sVA1l9J2k0Z+2W+I9+hcRdA6zB0
	Hb8Q==
X-Gm-Message-State: APjAAAUSckgUzwj18b20WSGHgz9aBTMCs7vOAK6lUZwW2cxP7DqRXdnn
	v+nHaz1YFXuKKPT9Mhm3eednIaw81s8=
X-Google-Smtp-Source: APXvYqwIxRnaHuy1D5+KRdLjzmRiMPxFZAKo2IEv4VWS3th6czQc/NYVDTJS8ikKur9Dsflx4cQTGA==
X-Received: by 2002:a1c:e386:: with SMTP id a128mr5089117wmh.69.1558477916436; 
	Tue, 21 May 2019 15:31:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k184sm10147410wmk.0.2019.05.21.15.31.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 15:31:55 -0700 (PDT)
Message-ID: <090bebe4dfd6ba60188c0476aea5469787a94822.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, "Li, Changqing"
	<changqing.li@windriver.com>, Sakib Sajal <sakib.sajal@windriver.com>
Date: Tue, 21 May 2019 23:31:54 +0100
In-Reply-To: <7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
	<6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
	<2b4e8d0f-cbb9-d2e4-c17d-33950d3cf9df@windriver.com>
	<7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 21 May 2019 22:31:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 23:28 +0100, richard.purdie@linuxfoundation.org
wrote:
> Just to update from my perspective:
> 
> quilt and lib*-perl all look like missing perl module dependencies.
> The place those dependencies are missing may be for the ptest or may
> be the actual PN package itself, depending on where the module
> dependency is.

I've sent out a further patch series which resolves some of the issues.
Some quilt tests now pass, some still fail. The perl modules fail in
different ways to before, there are clearly more missing dependencies
to be added.

A quick summary of roughly the recipes still with problems (not 100%
accurately filtered):

==============================================================================================================
PTest Result Summary
==============================================================================================================
--------------------------------------------------------------------------------------------------------------
Recipe                       | Passed      | Failed    | Skipped   | Time(s)   
--------------------------------------------------------------------------------------------------------------
bash                         | 41          | 3         | 0         | 107 T
bluez5                       | 23          | 2         | 0         | 5
dbus-test                    | 0           | 0         | 0         | 91 T
diffutils                    | 19          | 0         | 2         | 1
e2fsprogs                    | 0           | 0         | 0         | 108 T
elfutils                     | 172         | 24        | 7         | 19
gettext                      | 354         | 21        | 37        | 33
glib-2.0                     | 245         | 0         | 0         | 367
gstreamer1.0                 | 103         | 1         | 0         | 103
gzip                         | 19          | 0         | 3         | 3
kbd                          | 5           | 2         | 0         | 0
libconvert-asn1-perl         | 0           | 22        | 0         | 0
liberror-perl                | 2           | 13        | 0         | 0
libpcre                      | 3           | 0         | 0         | 2
libtest-needs-perl           | 0           | 2         | 0         | 0
libtimedate-perl             | 3           | 2         | 0         | 0
liburi-perl                  | 0           | 39        | 2         | 0
libxml-namespacesupport-perl | 0           | 1         | 0         | 0
libxml-parser-perl           | 0           | 15        | 0         | 0
libxml-perl                  | 0           | 6         | 0         | 0
libxml-sax-base-perl         | 2           | 17        | 0         | 1
libxml-sax-perl              | 0           | 14        | 0         | 0
libxml-simple-perl           | 0           | 14        | 0         | 0
lttng-tools                  | 3397        | 626       | 1         | 350 T
m4                           | 144         | 8         | 18        | 5
nettle                       | 97          | 0         | 2         | 8
openssh                      | 15          | 1         | 1         | 138
openssl                      | 146         | 1         | 8         | 87
opkg                         | 0           | 0         | 0         | 9
parted                       | 41          | 1         | 22        | 4
perl                         | 2423        | 19        | 238       | 727
python                       | 301         | 6         | 41        | 325
python3                      | 30277       | 2         | 1043      | 1005
quilt                        | 10          | 47        | 0         | 24
tcl                          | 149         | 0         | 0         | 177
valgrind                     | 149         | 1         | 9         | 552
--------------------------------------------------------------------------------------------------------------

Cheers,

Richard


