Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 81A876BB2F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 23:21:37 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jz11so112163veb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 16:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qv7tjUx61m4/eYjTBP2GLsyrytquzPc7sZcjb+CAveA=;
	b=fSp3jot1cA2ExPr6BpwKX2OGhL1azh1tiIQOdXLZN/J0a3KcVdWZhfb5uRA7D2Thka
	H7dtmPpzh93VAprn2kqdHqdZE62qguefOgeyyAU6Y7K39bJWhkRPy6dqfLKuzLodxNkp
	l53IRd85T9rIVNnGP8HWTOaSTm6Otb9rf1fcw0UFfdRNVI1lRUCKdOKw5bw8GU53yK9q
	hRrsIQA77ILyqELKwhEr22Qun9Xrkx/fpG5UeckIjiC0KYU9WrfZ1QI7tAe8/ITqaLGM
	mKqCK9JKWEd4h+oBMf0874WbsVgPP5wFy8Q1BwSFCCeaMU7zMl5DwDaoUnRkpSSVmYut
	b76g==
X-Gm-Message-State: ALoCoQnnnse0DpdyJ+tmBN9zad0p2WrD6WKHjte8DZ1EBAfjaUuBgtRq6oJpn/8cHo2LS90Yee0H
X-Received: by 10.58.11.73 with SMTP id o9mr3487091veb.8.1383348099092; Fri,
	01 Nov 2013 16:21:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 1 Nov 2013 16:21:19 -0700 (PDT)
In-Reply-To: <1383339883.8901.42.camel@x121e.pbcl.net>
References: <1383335233-12366-1-git-send-email-ross.burton@intel.com>
	<1383339883.8901.42.camel@x121e.pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Nov 2013 23:21:19 +0000
Message-ID: <CAJTo0LYZxDpY=zW5k0Vz83r1-XFXbdHVgvAHB7c+nxd5Pxmn9Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wipe-sysroot: explain what is being deleted and require confirmation
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
X-List-Received-Date: Fri, 01 Nov 2013 23:21:37 -0000
Content-Type: text/plain; charset=UTF-8

On 1 November 2013 21:04, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2013-11-01 at 19:47 +0000, Ross Burton wrote:
>> Instead of rushing into deleting entire directory trees without any warning,
>> print the directories and files that will be deleted and require confirmation
>> from the user (via --force) that they want files to be deleted.
>
> "--force" seems like a bit of an odd name for an argument that you have
> to supply in order for the script to do anything useful.  Why would the
> user be running a script named "wipe-sysroot" if they didn't want the
> sysroot to be deleted?

I'm open to alternative wording but the essence is "don't delete stuff
if the user does something like wipe-sysroot --help".

Ross

