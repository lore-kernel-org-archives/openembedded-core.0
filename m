Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id CE7566B437
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 14:44:27 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id hz10so2096006vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lrvPxzv0pXlSyq2h7FJ6VgnHr+ELFmel5wCxnex4dc8=;
	b=CKPkr/ahtroL5yb5TcU1TXuni7cx8BK978jOKqFdLHf8O2ffa9AiyG+EArXXMqafkV
	W6LJ0fPQCUjMZ3p9L7K4kTOUTZQF07rIIKvGhCMbSMO+e8sJlCNfvIUvmya/cCcl07Zq
	QTHozEFSqggFXAzZHDfZk/II4kQWYENDmWAx7i2x13RUWpto7KHEPCCpKRZGrEpH1qgU
	Igx3TiTjVf2MoM2g1mtwp4mDfK8Ef6jdL0tzkNKzFsvV9PkXOekpeOxbMB0RINk93uFo
	MRx5LyNnNJYVhA7v+I5JjxUqSrniXx6pIfjk40RzsJHhODuA6Thea+mSaAMCbROvacf8
	JtqQ==
X-Received: by 10.52.164.227 with SMTP id yt3mr21720115vdb.107.1375109067787; 
	Mon, 29 Jul 2013 07:44:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 07:44:07 -0700 (PDT)
In-Reply-To: <1375108618.13247.35.camel@phil-desktop.brightsign>
References: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAJTo0Lb5Unw3jW_ytf+Q5hDAwN8AosHdGGxmynuHNHJcCyHwtQ@mail.gmail.com>
	<1375108618.13247.35.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 15:44:07 +0100
Message-ID: <CAJTo0LYuF-wae=J_qkpNOdJ54W-p-E4imRac850ug=qiJ+o0+w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmS7/PPMks5ZFWyov/lSaluRfrJ8guuvhjsXnrWCt/bmXjU8xMSS5894RRcDLlnGfygwbVE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] [V2] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Mon, 29 Jul 2013 14:44:28 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 15:36, Phil Blundell <pb@pbcl.net> wrote:
>> Not sure we need the listdir(), why should the function only delete
>> the directory if it has contents?  If it doesn't have contents you'll
>> be packaging an empty directory.
>
> The directory he's deleting is different to the one that he's listing.

Well spotted.  I'll go get another coffee before "reviewing" anything
else today!

Ross

