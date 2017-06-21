Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 62C8D77BC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 07:27:36 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id p21so3646173qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DcDCxFK2qQIVW8Mb9Vf1YPqhgMVdm/l3aEh1uA4QiOE=;
	b=LtncMoYJxNwJqBydaSoPRoU/X8Fjq8B0Icn7bljreyTgi4nnoZH5O7yxGnXFd5jeb8
	y65Qc7QytzHkC+GUh0UQU1e6QY4/u7rKlqepW+5A3U+c/xRXwFW8dZ99Yg99nE1R3IFv
	Z6g5wOIzD+Ix6A4u2oSYzSj8YpbElo81sxR7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DcDCxFK2qQIVW8Mb9Vf1YPqhgMVdm/l3aEh1uA4QiOE=;
	b=eAsBnReVlGSRVjeXYxHFX11dJHXH4Cvmgyrb3ltjvFs61jFrrDf3zOcf2xfjkwYJPN
	pvq7xMRwTatySftPGRjqGM+8KBxLeNlZ6KoP00evnrtlmOVOCiAkrCxp7bOcyexP07rY
	L0/ySDTWGHIVdfLMrtwQC7LuXRIX/5mZIuCpUL0CGkFCw3gY1JVsPrXPmYqGMcaFXoRP
	0vIliNpuZ5eE6PqA6JyJamDMBjc87eOpClgpR1ZxQkiCtUrU/4rIrai959PvZic9OmuK
	AZkAPqUJxT55/siH8od0AiuY5Lh8V5ucKT+IByq4tqd9x/U0CVJVoknLN8k1CGOzLWUX
	RpAw==
X-Gm-Message-State: AKS2vOy/XgP8VET8WQCbT/dQbc8C4f4V8YPLuwXaGSi0yr/rp75BT9YN
	hmitJ+pKsG+Lmi3pl09JvT8tXECS2qD3
X-Received: by 10.55.124.194 with SMTP id x185mr35822180qkc.215.1498030057293; 
	Wed, 21 Jun 2017 00:27:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.204 with HTTP; Wed, 21 Jun 2017 00:27:16 -0700 (PDT)
In-Reply-To: <641d1df8-77f2-3b96-30d5-d770a5e44a9e@yadro.com>
References: <CAMKF1sp3SnGKG7OGuNJAwXZiSUBLDykr8Ds982WdXwJxZ5sNfQ@mail.gmail.com>
	<641d1df8-77f2-3b96-30d5-d770a5e44a9e@yadro.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 21 Jun 2017 09:27:16 +0200
Message-ID: <CAP71WjwskmSHF3ns94gihZsmq7t4Oe+o2_JKKQ57RKQ57nBwvw@mail.gmail.com>
To: Anton Novikov <a.novikov@yadro.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Some Arch Linux build fixes
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
X-List-Received-Date: Wed, 21 Jun 2017 07:27:36 -0000
Content-Type: text/plain; charset="UTF-8"

hi,

On Wed, Jun 21, 2017 at 9:04 AM, Anton Novikov <a.novikov@yadro.com> wrote:
>
> Hi all,
>
> people at yocto@yoctoproject.org sent me here.
>
> Please review my commits and apply them or provide me with help to
>
> do it myself.

Patches need to be sent to the mailing list as inline patch, we wont'
do review on github.

please have a look at

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

