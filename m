Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2425961883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 12:59:14 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id cz11so2182786veb.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 05:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=j6+UOOZO9YFUwdgW7C2U0Zdl6/hyG64E/IVo0XsoomQ=;
	b=CQvhIe5fcLar0OiH2GLCSjRhgLPsgas1SE3xiwALZTq3FglDpYSSbNylVS/oY//zrG
	BB69+wjvvSuIRZUew6SZ2c2fApD6SEGTrGbLcBLL0QkjUBpk5DZSPEzM8k06IkUPjuWo
	V41Dzus6nYlJha7EnLqOpvktVEqBramxQr96cVQ/4ylRuFWki9QmLk8aZEPYlhGtRGev
	pBYOR2lz0BzzDTEey6dg8qOqAdPiSEeY/p3hfXSikkKRXalXWeuxDreTjKvbupYA3DTu
	y8wgZtzBqmRvnF0hJpGTHlNUq+THU37i8ESjqW/vRRQuTXBpSLnLmaNiVcd00paClOsH
	mhxQ==
X-Received: by 10.52.163.46 with SMTP id yf14mr348498vdb.58.1375361954368;
	Thu, 01 Aug 2013 05:59:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 05:58:53 -0700 (PDT)
In-Reply-To: <CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
	<CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 13:58:53 +0100
Message-ID: <CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQnrQHSrSBw/1Lwco45NdbgsikMYohqj470rnaopFZkCnM00ivntnI1ZGeqCjD1HqApOhRmx
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 12:59:14 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 12:18, Laszlo Papp <lpapp@kde.org> wrote:
>> It cannot be more specific without dumping the entire machine
>> configuration, which won't help because a variable is *not* set.
>
> No no, it could print out the concrete file to look up, not just a name.
> Besides, I would probably even print a warning about the entry point and
> load address not set.

This is a simple "can I even build?" check, and UBOOT_MACHINE is sufficient.

Our users are not totally useless, I think they can find their own
machine configuration files.

>> By "machine configuration can be in the command line" do you mean
>> MACHINE=foo?  And if so, why does that mean the statement is vague?
>
> Well, you could place a warning for instance when it is set to the same as
> in the config file. That is probably not what the user intended.

I'm not sure what you meant here.  Do you mean a situation where the
local.conf says MACHINE=foo and the user also sets MACHINE=foo in the
environment?

Ross

