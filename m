Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAAF61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:36:09 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so2557096vea.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7gg2ARPDNFt4jVw+5tDWZ8/E/NS2gg8dg5b788Vrp9Y=;
	b=i/M2RlUh2s0t7eFY3fiP4syazQFeM7YK60OWn0ls8cXnAOxGFJYr8IXCHfulhOMZHI
	Y6Uz2fDAJr5xlNMABiD8bOHxn5Q1J7yFZnyzey2WL2/uvG9ZITv0k7RQ+dF96UkYLqQl
	3XNLfaZMIgfQu3NPaVimi+vMXvUiLHhSYrlUiFiDbWOeyshYkOwq9foIhiebzYeQUtjV
	XmKmjwzJFvmPFJQuYrdwdQ0LeCx67uDT0ZpAnIs/LJMPGWW5a6bE5WjkyYI5JLUcIWq1
	iknqiGlgh2rjM7NAD6tmNqHI7WwEBPQLZv5YPNDr2zPgWAKCGMqolc89hgQ4Ss1a1EIJ
	F69A==
X-Received: by 10.52.164.227 with SMTP id yt3mr590625vdb.107.1375374969476;
	Thu, 01 Aug 2013 09:36:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 09:35:49 -0700 (PDT)
In-Reply-To: <CAOMwXhNfdQ_41HybptW0xgqBZhOGOx7pgdJ8M5F+qVs5Qd5vvA@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
	<CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
	<CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
	<CAOMwXhNfdQ_41HybptW0xgqBZhOGOx7pgdJ8M5F+qVs5Qd5vvA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 17:35:49 +0100
Message-ID: <CAJTo0LaYiJsuJG6BNEHiCL8Ga+4EZ9S+vvAKRkiNyXQ16v1fMw@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQl3DC8caNmTbQvze0VT+2pDs8EQtgh5MENWh8EbWZlUHtRO9uFUUXhKxwoQJ/tZMWWnwrMA
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
X-List-Received-Date: Thu, 01 Aug 2013 16:36:09 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 17:33, Laszlo Papp <lpapp@kde.org> wrote:
>> I'm not sure what you meant here.  Do you mean a situation where the
>> local.conf says MACHINE=foo and the user also sets MACHINE=foo in the
>> environment?
>
> Yes.

But there's nothing wrong with the user doing that at all.

Ross

