Return-Path: <niqingliang2003@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 13FC860746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 06:53:04 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id w127so779921vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 23:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=OLrFkT+0phuCI56wjYiyA3jGFzKqSmeDUlS/PdCuMxY=;
	b=g+qE6gM+gopH8L8Q6UWSdxCMdmZwkiT8+XHk8MKGqe6sb1Eq07huB88+sEPUEZJLX0
	cQCSw1ALYgmNmXTMt1ZSnrQptj51Xzo1ltLcrCJdWyEFYkL+5YkTHiO/grq/8xXwbZfF
	0oy/XAHphrSFNPRDRjN2zZgtFCFjwvY9Y4WVkwrrv5sxW4yqxMy+nR19CHRIxPwckZBV
	8DlKBfA3eWFzT463KtzLLYhbELusdQ2BXkKicF61ATROTGzFtTuCf7ok2FriW+2sfhZS
	+3WwAETcnhQYMTsCF7inp+MygUMebHpk/paxqcJg2ModDUUr+YNDXlL5TTjVq120cgmN
	zm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=OLrFkT+0phuCI56wjYiyA3jGFzKqSmeDUlS/PdCuMxY=;
	b=QnQHugOno7iM1Ppgs2j1i2AyGz5ET3NCfuScaLRNUICHf9Kgi+sl27mcGzMMODbm3y
	eYNmgjqOBbbYei61IyvjyfAqXHQ/MOKq8xOajSVCn1EkFYFRXaY+6v4zluJck6K4mfAu
	I5Z76Kq5ANqyus8U+hWYGwX6VwF0J01bvZKA33ojyR2eMNoJblJ6t61di2npBRUVAFlY
	gKiDu0cv8hWcrkSHQU7AYDh+NZeG2H0GlWUtutQJHFj2/1LzJcLKZyYWNjICrAsJgEJj
	BHRMTqI6kF65SFFEpZOZcs7WY0HaCWR4PXdjZp6VubKGrxNFAYWcsJun8PBXEEaN9ush
	5PiQ==
X-Gm-Message-State: ALyK8tIlWJHaDZEJpO2rZ55mNpom6twIn9HC/a8ffzg5htpPYvioUHRe9DXnZdWSWVHdRKv7mUdaOaGz7vIZ9Q==
X-Received: by 10.176.3.116 with SMTP id 107mr19739440uat.131.1468911184539;
	Mon, 18 Jul 2016 23:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.13.199 with HTTP; Mon, 18 Jul 2016 23:53:04 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
Date: Tue, 19 Jul 2016 06:53:04 +0000
Message-ID: <CADwFkYf23qz0t+gH4r80r3tstXkkQ_2hDDa0cKjZf7CGa62Pyw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [BUG] gcc: require neon on arch without neon
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
X-List-Received-Date: Tue, 19 Jul 2016 06:53:05 -0000
Content-Type: text/plain; charset=UTF-8

when compiling qtbase in meta-qt5, it says:
| ../../include/QtCore/../../../git/src/corelib/global/qendian.h:143:36:
fatal error: You must enable NEON instructions (e.g.
-mfloat-abi=softfp -mfpu=neon) to use these intrinsics.
|      return __builtin_bswap16(source);
|                                     ^


bug description:
      https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71056
upstream patch:
      https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=236910
mirror on github:
    https://github.com/gcc-mirror/gcc/commit/84d2a5509892b65ed60d39e6e2f9719e3762e40e

Yi Qingliang

