Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 66AAB6ADE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 20:59:18 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so1229318pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Pp6LucgrkGkVhjb0ZL4QCC3r/sQezD7cVg/ANbwMcpo=;
	b=vmrYpsDQ2xZPf65dCmmcZKemZgV9w30BfsX+Ihw21CMHVaPopoQjvbUKuMbszwKAVN
	pRqXgCWlU6fijBXcb3xgeLxwtvmMeMLkKMfjOYdVo6kcjCSodlTgizPXS7VH5UYlkaYC
	eMJqaW503QCJB14Hj/um7pK7HVpiYrJy8Ef4xzfyjhGDCRgHdkP+mKuyMIM/pbjAX6f6
	/NskTcx8a3+Ku1WYBxEVNiw9vNxPrn9X7/Xxw5uMFHP6y6dFfLomakxFksrCBYsTOhrk
	MXw36rKxe2ZEUtKgXpoeCaoXpiyO0QPTm5CiTC/mJ4DPTGRKQTJIusVm7bKWxGAZzQ1e
	oZ7w==
X-Received: by 10.68.171.194 with SMTP id aw2mr82392717pbc.197.1375304358995; 
	Wed, 31 Jul 2013 13:59:18 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id w8sm264309pab.12.2013.07.31.13.59.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 13:59:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F97628.9040801@linux.intel.com>
Date: Wed, 31 Jul 2013 13:59:15 -0700
Message-Id: <7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
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
X-List-Received-Date: Wed, 31 Jul 2013 20:59:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 31, 2013, at 1:40 PM, Saul Wold <sgw@linux.intel.com> wrote:

>=20
> Tried to build this set and received failures in python3-jinja =
(do_sanitize) and python3-distribute (do_compile)
>=20
>=20
>> DEBUG: Executing shell function do_sanitize
>> =
/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/python3-jinja/1.2-r1/=
temp/run.do_sanitize.22474: line 85: =
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native=
/python3: No such file or directory

seems like missing dependency on python3-native. I will take a look.=

