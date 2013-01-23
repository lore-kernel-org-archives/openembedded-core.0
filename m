Received: from mail-qa0-f42.google.com ([209.85.216.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1Ty2Jx-0004MS-0N
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 16:33:10 +0100
Received: by mail-qa0-f42.google.com with SMTP id hg5so606880qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=FbjgFBkpt5z+BkcX/wr0IjDk4FDWQK9iT3FDy8403wk=;
	b=dMhu8BVVMR2Wnfujh3gWrOWemAneKaNhSLlSVbeyyTffVAAjtSktVxDy9NCfPLOwCy
	pl56AU2wF/ffp1GAfeDzjtBntwiG0CfUqfQNKzgb4XoIpUEPF588UAoRCpyYj/OPHct2
	+3HseApr5xL7z9IFBqvnaNAr+Xi4MWhR8l4hEuTQzn0mBb7I4NUBpDCGtPKYxe2LKA9i
	VInIXndQgukfAXIVn4Xz3wmS1aEOqOtIju+QLZltJG5SPmGyt8Z0BDZohD/wH++OTTyx
	0vylDBFdHFhsR9IhxeacR1hlzMgj2h5UcGobvirow588hWmFm5J4vYm33V+R2Iky9NVp
	S6Mw==
MIME-Version: 1.0
X-Received: by 10.224.76.206 with SMTP id d14mr2213625qak.5.1358954249166;
	Wed, 23 Jan 2013 07:17:29 -0800 (PST)
Received: by 10.49.106.5 with HTTP; Wed, 23 Jan 2013 07:17:29 -0800 (PST)
Date: Wed, 23 Jan 2013 17:17:29 +0200
Message-ID: <CADV-EXEOBjzSEtxPGzPr9wRfKB_SE3kwOX++L9qLQmmV4_tSKw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Failure building Yocto 3.0 kernel
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
X-List-Received-Date: Wed, 23 Jan 2013 15:33:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!

When building linux-yocto_3.0 kernel for cedartrail, I'm getting
numerous errors:
SSE instruction set disabled, using 387 arithmetics [enabled by default]

How can I fix it?

P.S.
I'm using following revisions of meta packages:
meta              = "master:751c11e998431613389f094264f096fac5a1c1ae"
meta-cedartrail   = "master:d92dd091397b4c77000c2db152bb621a62b76cf9"

Best regards,
Yevhen


