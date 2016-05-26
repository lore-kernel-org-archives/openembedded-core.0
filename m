Return-Path: <cliff.brake@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7C9731BE;
	Thu, 26 May 2016 17:46:20 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id j1so135955665oih.3;
	Thu, 26 May 2016 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc; bh=O+lOj1Gsee0cNLydfn1t5AL+2e2z2Bgu85ULMK/Fpns=;
	b=G9GI757o8Q0PrtHPjPhuvbaFeUG+N9qv7GRD4jzPevBG4TJow5vJt7VIa2k3Nd7O05
	ZaUtDga67cNpiEl/aLrr3bBFOc0qAuMka02BWvNuTmNRhvLP4+gpcMuRjIhVwuHg1I/Z
	XrNKy+FlyrRPzameth3kwFVhfPA0pG+QRsYVTyjSS/QIPnIcafqkF/j9svPMws4lBL9U
	OEnnxzxhGUolwnVT+qObBPDHTtV9+KdXnmGF7KQGUwo0fM/OVK+eW+KSCcw5wZYaK8Te
	jvJexWBdfUE/6rAI7c1Ib+xzTcsvZFzxLhxJJpFih/SEyyQjXVXUBeKVf6KLwhu1rLSf
	b6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=O+lOj1Gsee0cNLydfn1t5AL+2e2z2Bgu85ULMK/Fpns=;
	b=Y7CGoJwZM2Or2gkV/19gRKkamWO7UoOHiFgo6fti1CCsTURd/VeCHVkpdo5FrVumhS
	o7RQCAi/+3XiQvCi8r2HeMaXOsNpWzZdwMrpMUyDTZXTws/9qOZQGb/6KJmh9kBecUNM
	v98TMUHs+TuvNzqajOchFQcsxmgCW9bGlLTo/arFEDDuhrUax5jvKsIWx5zaRWYofGUU
	aKH7XDbyLJlOXcmfOyOqO8LVcbDtN4VOoUeo/FnD+dzM41fk0f7rE3I02Wl6jpkA+Spm
	WnfL3n8Cv96FVrLeXYgLYcFfY3YBdguGykPqZmag0oFKYf8A9CvLgXF5N6K4KBhhcMjT
	yDwQ==
X-Gm-Message-State: ALyK8tKuijM8TzWvOz1I7mu7O0OTGIZNsI0uCfFFzWINj6DqwVT6ccG0ShfS4q9rWhACIS8B2TfTHYxHjM6bgg==
MIME-Version: 1.0
X-Received: by 10.202.228.78 with SMTP id b75mr6269413oih.46.1464284781527;
	Thu, 26 May 2016 10:46:21 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.157.35.230 with HTTP; Thu, 26 May 2016 10:46:21 -0700 (PDT)
In-Reply-To: <20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
Date: Thu, 26 May 2016 13:46:21 -0400
X-Google-Sender-Auth: friNJjqfQeje139eST4r22TWrNE
Message-ID: <CAOd_LFwLw9QMk4YdpbE2aD5k3CwiWQfcqhczdFM4=iBGhFQ98A@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 17:46:21 -0000
Content-Type: text/plain; charset=UTF-8

Done, thanks!

https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a02341562a9bf254b3dd9dc71704

Cliff


On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com> wrote:
>
> meta-java repo was moved to:
> git://git.yoctoproject.org/meta-java
>
> Is it possible to update the list with that info?
>

> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

