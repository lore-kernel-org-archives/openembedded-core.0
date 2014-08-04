Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id ED2BA60017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 02:59:33 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so8797416pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Aug 2014 19:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=40o3huVJZ4jR9njbdGe8NqH867glJF2Cr7kNd0yQC/M=;
	b=Ql05S6KUutLtzpbWCg5f7ZzzMJYnarRanTdDWE/7aZT0Bg9s1zFXpGOQIXS98Bduu5
	hzSSBmMV2vmBnjoAyJkaeyrTJ+PO4DSNR7CRIysu4/ONSsNRryd38OzFJbGmeFo8YzX6
	sDTjkxlka55YlU+UbtgsQwIGevFnksElWT+TeWPjkrifW1Fcn6IUdaoVaVuPaFwc1jkt
	/bM1HtmeswT0lqnK/faeJoea3QweFEIZFbpLKQTg+93daIDDlrs8lcVftqlQPhWzOv4k
	jPCmE/6MRlrl4yQ5WD+XkKZWNWMBUyyhjTggi7JX2vIayiz4Zug5oau4GCPrNDp+rAAt
	wcQg==
X-Received: by 10.66.176.97 with SMTP id ch1mr689862pac.101.1407121174511;
	Sun, 03 Aug 2014 19:59:34 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id x1sm24276982pdn.91.2014.08.03.19.59.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Aug 2014 19:59:33 -0700 (PDT)
Date: Sun, 3 Aug 2014 20:02:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20140804030247.GA18172@haswell>
References: <86wqaw5000.fsf@shell.gmplib.org> <53DA0C70.50403@windriver.com>
	<CAMKF1spmDkT6SOBRZjs7SGxnR72fJwdM4iJMxuoVRDw=4hZ-9A@mail.gmail.com>
	<53DEEC83.6070704@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53DEEC83.6070704@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: backport patches for gmp-4.x.x
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
X-List-Received-Date: Mon, 04 Aug 2014 02:59:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-04 10:14:27, Rongqing Li wrote:
> 
> 
> On 07/31/2014 11:38 PM, Khem Raj wrote:
> >On Thu, Jul 31, 2014 at 2:29 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
> >>Use GMP 6.0.0 or later of you dual-licensing is important.
> >
> >OK so you have a way forward now.
> >
> >
> 
> 
> I like to uprev it to 6.0.0, which is using the dual licensing,
> and its README says these two license are OR relation.

Thats OK. Make sure that GPLv2 set works ok with 6.x

