Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A33446ADE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 22:31:29 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx1so1393053pab.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=N0p5F8zEeuScm0knn1M5m2S+57UAb0f9kVQVJKLpgeA=;
	b=uwpOPRtVxghzQFRz3HytMrfTZ1+xMgIXqJqNsv/E8A6oi6wx5eD13yDtxuNDEvM61P
	fbM7m9BE4/Qr0vt8GOBEK/9VeZuCzH9+vEl8M3uELooAVzMzAcBcnL7/abet0TTCFGit
	0FvS2xDTadXE/ZVLj5Nt3KrnCNtEZcWq/ySD1lwr0oLioip8QQaRVXuki8pqoYIinHqI
	ogILA1YpSPszz/m13ewY9epDKazE2L9tDbaOKQGVlnbxtXXc62RXHREQ6QtuuvU0EvLR
	Ra8I5ymtxRb0HsyeS2Z12bXAe+CPfP0cBvWSEx1y6izYkkcgMuyw9TwI3q6PcbjQNNXg
	ZTQQ==
X-Received: by 10.66.235.39 with SMTP id uj7mr466381pac.122.1375309890286;
	Wed, 31 Jul 2013 15:31:30 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id qf7sm23169pac.14.2013.07.31.15.31.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 15:31:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
Date: Wed, 31 Jul 2013 15:31:27 -0700
Message-Id: <13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Wed, 31 Jul 2013 22:31:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 31, 2013, at 1:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

>=20
> On Jul 31, 2013, at 1:40 PM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
>>=20
>> Tried to build this set and received failures in python3-jinja =
(do_sanitize) and python3-distribute (do_compile)
>>=20
>>=20
>>> DEBUG: Executing shell function do_sanitize
>>> =
/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/python3-jinja/1.2-r1/=
temp/run.do_sanitize.22474: line 85: =
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native=
/python3: No such file or directory
>=20
> seems like missing dependency on python3-native. I will take a look.


I have pushed two patches on top of the current pull tree. That =
hopefully should fix both the issues. Please try them
out.=

