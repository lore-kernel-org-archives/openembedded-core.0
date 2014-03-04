Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C44F36A8F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 23:48:36 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so305533iec.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Mar 2014 15:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QWQ7uMnOW2rcBRsl+Ktd9mPvzT6RZr2dTToZsifTpCc=;
	b=AO6l4Hl1ThtqRvw2/WDJl5Q50pWUqw55DaNSALmhbVUPEVX8FkQv09a4moJ3/iJ0u2
	HsD9zFkGQ5YQHoys+pXGB46BmtL11VpElH3CF6aAlS0qv7/Ja4fXfuAcOekAlan8w0g/
	SmKEFcMkoZY1cuFtMF9ZSJQ6BQy7B5Ph0+LqgYCQuBMqSaVRvNOIdo0EA0MOMWl2lQlz
	MGJT1j84rGRH9sba5Su2itp5ASwV5sBmPURH5cBsTewgfScDym+E8fsCIACSU6RBOvEB
	sjaA76MWyG+nmOop5rzwDh32lkga2YsIRmZFYZktMD2ntrshNNAUZIu8QU3o6czhSPNS
	WulA==
X-Received: by 10.50.43.170 with SMTP id x10mr6302861igl.20.1393976917098;
	Tue, 04 Mar 2014 15:48:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Tue, 4 Mar 2014 15:48:06 -0800 (PST)
In-Reply-To: <CAJTo0Lbw5-7JmuHak4-hU35c73LG7CZWmxZ-0kDQ4rDrFDSZmA@mail.gmail.com>
References: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
	<5313F632.60207@windriver.com>
	<26065539-945D-4AB2-8AB3-797BB63B01D3@gmail.com>
	<CAJTo0Lbw5-7JmuHak4-hU35c73LG7CZWmxZ-0kDQ4rDrFDSZmA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Mar 2014 15:48:06 -0800
Message-ID: <CAMKF1spVxO2CYVzQqaUVydGbR4HS+V+w4DNw+sj2sn-wJ45b6A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: use ln -r to generate relative symlink
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
X-List-Received-Date: Tue, 04 Mar 2014 23:48:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 3, 2014 at 3:50 AM, Burton, Ross <ross.burton@intel.com> wrote:
> I wrote this patch on Debian stable...

yeah I jumped in too quick, master was debian, but this failed slave
node was ubuntu 12.04

