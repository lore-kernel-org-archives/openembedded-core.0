Return-Path: <Liam.Howlett@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F280A60017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 20:34:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0JKY3cR013072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 12:34:04 -0800 (PST)
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 19 Jan 2016 12:34:03 -0800
Date: Tue, 19 Jan 2016 15:34:01 -0500
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20160119203401.GB29493@yow-lhowlett-d0.wrs.com>
References: <1453234817-29076-1-git-send-email-Liam.Howlett@WindRiver.com>
MIME-Version: 1.0
In-Reply-To: <1453234817-29076-1-git-send-email-Liam.Howlett@WindRiver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Originating-IP: [128.224.56.205]
Subject: Re: [PATCH] toolchain-shar-relocate.sh: Detect python binary and location.
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
X-List-Received-Date: Tue, 19 Jan 2016 20:34:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please back port this patch to jethro as well.

Thanks,
Liam

* Liam R. Howlett <Liam.Howlett@WindRiver.com> [160119 15:20]:
> If /usr/bin/python does not exist, the exec of the toolchain relocation script
> will fail.  This was the case with FC23 without python2 installed.  Since the
> SDK extraction already contains python3 support, the fix only requires checking
> for the correct interpreter.
> 
> 
> Liam R. Howlett (1): meta/files/toolchain-shar-relocate.sh: Detect different
> python binaries     and select one that exists.
> 
>  meta/files/toolchain-shar-relocate.sh | 19 +++++++++++++++++-- 1 file changed,
>  17 insertions(+), 2 deletions(-)
> 
> -- 2.1.4
> 

