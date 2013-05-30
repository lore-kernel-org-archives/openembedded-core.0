Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B9E7A61F27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 02:24:04 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id c13so27265276ieb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 19:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Z5YSnwGQP25aqeCZmHteQUP8zh5HAhS/sz8bOxiDz1M=;
	b=SSOwjEE1EPXK8TmAf9uOke8de2tad144LWh0VmVvvrESgRJnBtYr/weYNl7Byd64Yt
	PM0jh1OV1GVjyjopSr03X5UTw+VnGZkKUw0eQDZhP0AZjI4h7CupIRRWMMHVcxhtby1f
	Cc1ju4tVz89daRSSlZLEUrbzWo8hpe1RlDFkyqC13Q1yO8yhtaifExHbGDAVytFxj1Fl
	aG6xY9VKp+GmgPazGB4bRFz/6hn3UVE3Mm7eVPhTTrWtdOgnPQoPCl3UNMulaK9J9Gxe
	dU/phx4cDbSm1lelW2JGeor31StbCcHN8gUPbzZrS5mGXJs4N861GNYeAh0PcxqeT6Ig
	X32g==
X-Received: by 10.50.78.100 with SMTP id a4mr2747315igx.102.1369880645967;
	Wed, 29 May 2013 19:24:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.108.45 with HTTP; Wed, 29 May 2013 19:23:35 -0700 (PDT)
In-Reply-To: <51A6AC93.7030103@linux.intel.com>
References: <1369078242-4032-1-git-send-email-jslater@windriver.com>
	<1369078242-4032-2-git-send-email-jslater@windriver.com>
	<51A6AC93.7030103@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2013 19:23:35 -0700
Message-ID: <CAMKF1sqoasj4UmXHKbJ_fctatO7gCf5rcp9vL8cqB4QmmVHcjw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Joe Slater <jslater@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: adjust hwclock ALTERNATIVE_PRIORITY
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
X-List-Received-Date: Thu, 30 May 2013 02:24:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 29, 2013 at 6:34 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Can the nslu2 layer which seems to be maintained by Khem Raj take a patch
> that will set the ALTERNATIVE_PRIORITY of hwclock to 10, we might need to
> have a patch here:

sure.

