Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7665276802
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 01:10:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 187so13184313wmz.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 18:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y0BlG5LSmmBZ+qF++95cLQq6wg+uUIydtBC4hcUd/nY=;
	b=AvlWWoSqEC09mNj2ljM5vnPfKtF+MyWVZIDYhKDifypCAd66ZBKgono2tRcY2Dz1Cb
	sY9eFRzo/ENi+1dtuKeLA99RLbyvxJs0cIvb0/HUGbApn0XI100L5cmbSjqbMRmGCgdh
	j9x1rk+AOg3fBpD0YGVC7SafP1qj6y50GOuJugxFbdoAePBq2tiE/mK2vPT48HGAmP7R
	Vw+FR3lO4/198rtPNAFWeSHGhtOfw8/Ohd7VRCFd10QAv1aRMv9ClUzKglguszyRlvca
	Zm8Tj/DcAmVpFQBfW9gjXkmaAZVRMypUIPrcIAbrR3h8UL72LpnN0OWlb7cwMlrswbhh
	fMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y0BlG5LSmmBZ+qF++95cLQq6wg+uUIydtBC4hcUd/nY=;
	b=icDRJv+ZVo3OOZ9M2HsQ1oPEqmQoNzTc/kQmkKqXaopPg+RrkTBy+YIIah3sONBKxF
	NopLYjwkvhlD13lHrl1l2E3De91OF6y3x9vvG7qi/ykVVg9WtSllZP1SAzQ+wV41xIZs
	PF7SrN6Y4uLZ6cDbTo5VSGzW7DF6Og+u3pEafs1/lcaPCcahnCLE6xUryKeyRvIN8X1F
	7h3X7bOy/aAuu4DO6XyOCIwKOMbCkopRTq8BK01uRSJx8J+f+XqX7174mdjGf5gfF2gO
	cgfAwB7fX7W6uAQO9yB6AQO5Wu9kykZx9jh6PtEYz2QjAB6Nu35K5RA88oIKA9lMHNAe
	JfoA==
X-Gm-Message-State: ALyK8tKVd2S8MiaS0dXlWjfWYxdYkX5V2IyTq9Uk1im2mGZDBxUUMi55Qow1SwFZjE1oVftTixvomh5mLZKclA==
X-Received: by 10.194.76.33 with SMTP id h1mr1952890wjw.43.1466125809933; Thu,
	16 Jun 2016 18:10:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Thu, 16 Jun 2016 18:10:09 -0700 (PDT)
In-Reply-To: <CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Jun 2016 18:10:09 -0700
Message-ID: <CAJ86T=VA5n8==dM4v-AdToxkKfgTH3vTgOBijpJBYjcvygp_Jw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Fri, 17 Jun 2016 01:10:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 2:47 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 June 2016 at 21:49, Mark Asselstine <mark.asselstine@windriver.com>
> wrote:
>>
>> While waiting to hear back about my inquiry I did take some
>> time to put together this patch that allows things that
>> require the older vte to continue to build. Since xfce4-terminal
>> lives in meta-openembedded this might make more sense to carry
>> over there. I am sure folks will have an opinion so sending this
>> out as an RFC.
>
> That's certainly a good argument for putting the old vte in meta-oe.

The meta-oe layers generally have a higher priority than oe-core, so
having an older version in meta-oe and a newer version in oe-core can
lead to unexpected results.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

