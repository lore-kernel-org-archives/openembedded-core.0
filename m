Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id CA34F780BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 07:43:37 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id 1so1603010pla.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 23:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vg+GSXA7f5HsDam/tO5FFv45ctfVPwcrmUMlvF/J3Ks=;
	b=Pz5lC7Z+c9Mct2pd/2yIr7GXmJ8p5bcZDOpFGHFLE9r4NoYA9U9qMDTYNsaUGQmWVp
	AV+V5oOnwQ6Fs2TVtwB7t3VC9R3E4EYVnIJJwe7GHTGRuR4gtbCltsmRbJmQy9q8TyPU
	nmJ787xQ0yaMMUnJttcRD2BjEULixVEh4J4wfFcjUg3tSdGvTrLqy4pJXLY/hgUYKReO
	6HJpere9v/VGJ6ZrewDIZuV2SmlQUSHHtKSkpNUbWfBmfsnxlGPlgtT/29v5J2mU5LSw
	sstE+G5Mr95NcqBMOQp3SxTR0pH+rdIH9uVysGjQQNaYoBS85k2UNYIqzYsi+Ws2hkbF
	pWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vg+GSXA7f5HsDam/tO5FFv45ctfVPwcrmUMlvF/J3Ks=;
	b=AVqz5lw05AFBIbamobJbzWMcYl3h2qIuMIbnA3LSTmo/GD6Vdzk4e0iHUeOBhJOHuM
	mYxzJqw8qagVEoEAtDfHRJLFPuhpJQ0ICi2GvZ+0iwawFJplkHEd5pZZXAASK+19T65O
	pJTSeyBScp1wCXGUi0NPkvCYI7z39wqy04pZEiqxK+cetgZ4h/24fcxhW0uHKuNVuaYK
	VpLytuxyDatV1UEYOkvInAtoC3Z2xPLwZTt1c0cd51F0msiMMwrQu1cyoHds7wmnsWcu
	AqzliZ4RdX/Z0+6DmL8wYBKZZlbK0NuKWmAI+rHqz4mwd/SHN33JOh6rEVvAsxll6CAz
	eN+w==
X-Gm-Message-State: AJaThX6egmDBNhOzaToOLhj6z7NXSWOLnS6z8n6K1SS9jogLYDGufYVU
	plpqxaju7MFrmJLTDAiAT9W4vcix2mEWJf4XgFU=
X-Google-Smtp-Source: AGs4zMYUNuPXJWFtv37nJwRlBvZK2VayQHPAk/DpykTK1Fz63WSdVNVxkfGt8QpfaQy6pPK3zWsZRzE3jgeZdwsludg=
X-Received: by 10.84.252.4 with SMTP id x4mr1904464pll.99.1511941418948; Tue,
	28 Nov 2017 23:43:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 28 Nov 2017 23:43:08 -0800 (PST)
In-Reply-To: <b9190a91-6e8b-8f6a-357f-74d1d2919eee@linux.intel.com>
References: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
	<3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
	<b9190a91-6e8b-8f6a-357f-74d1d2919eee@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2017 23:43:08 -0800
Message-ID: <CAMKF1sq1NFnDOAOi0eZdmSPpsuKmi90qL==NBV69NLWkuRz-AQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: add license checksum change handling to 'devtool upgrade'
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
X-List-Received-Date: Wed, 29 Nov 2017 07:43:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 27, 2017 at 11:23 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/27/2017 08:11 PM, Khem Raj wrote:
>>>
>>> 3) and the cool part: devtool will create a diff of the old and new
>>> licenses,
>>> and write the diff into the workspace recipe as a comment, like this:
>>>
>>
>> adding a comment in recipe itself might start folks sending patches with
>> this text in the recipe changes. It should just be in commit message.
>
>
> I'm not sure if this was clear, but the auto-generated license diff is meant
> as a starting point for a commit summary written by a human, and once the
> summary is written, should be deleted, regardless of whether it was placed
> in a recipe, commit message or a separate file. Devtool does not create or
> manage commits from the changes it makes to recipes, and so placing this
> into the recipe felt the most appropriate to me (separate files are more
> cumbersome to manage and printing to stdout can be forgotten). We can have
> an automatic patch qa check that it's not accidentally left over, similar to
> the existing check that license changes have an explanation.

I think emitting this info to stdout should be enough.

