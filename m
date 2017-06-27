Return-Path: <net147@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8885977DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 11:11:35 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id z62so15408095ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4EaYRMMyHiAVd9ddZ0LbiK6RQI6V5QJ1SNqBTlQ80cQ=;
	b=fYhzoIUIawYP43q88SWaMrgJLuUef33khEvhT0vw5afYHFkPBveOBNxzIBBdT31U30
	xVb+d0RpCG/VpjKD/P9Rh+9t6gyFhhlcbh4f8l57Ba2Jwa6pPm7asGzxHAYNx7E0kSC8
	poQohtOv+LVoDAzBcj+1+WTShAomnfgjppwJHfWGT7rv+Nuk+eVULdm1RF1Q625krxwG
	/pgxuCI1P4qhlZdr4X8SOVxB8l//ZIJ8ZnQJwYHYJj20EtE6D5r2HEvECLbN3O++coq4
	yL5SWroTz6y8EIobKkEszY9ouLM16hdy9eel9ku3pK7PCGthrvWrXcW5UjxrFNMjUfEZ
	s9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4EaYRMMyHiAVd9ddZ0LbiK6RQI6V5QJ1SNqBTlQ80cQ=;
	b=IR3OcuamyT0Btx5Q2Id0g94uqZzlCqwQnYPij8tRXJ20d/TEFy8ce7HqPrCx9pV/dP
	A305sOktQCpmDssQqttTegMXpko+ePCMQOa//kp9TKYYekqeUmy2CcpMX29zm7tEEgUx
	5ycgfOlZGQdoum/wer24j4BadS/u7nCC3+KTuScyEptxMa9AOm/EKog31etiEHnCJz/p
	j/VSgmGHc2M0VTGTJkzsL1twQaLUEYxbMM7v3qHx1daB4V61JVUB2J+ZnxDcWQopKZ41
	osu682Ahv3koclseUGhbwdl7MyiRcvSPrsP995smh4WH9hes+pem62uamusNuThMdrEz
	0pzw==
X-Gm-Message-State: AKS2vOzmKzqehnpYxwqRldOsqH3uy550iB7RKqh72lqnu9cG/ua4BYHP
	KY4PDPEaTc1fnV6vGVfoYU/NMfQJwWqZ
X-Received: by 10.107.9.160 with SMTP id 32mr5479763ioj.212.1498561897244;
	Tue, 27 Jun 2017 04:11:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.104 with HTTP; Tue, 27 Jun 2017 04:11:36 -0700 (PDT)
In-Reply-To: <1498559907.7464.42.camel@intel.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<1498558903.7464.37.camel@intel.com>
	<CANwerB3jfo=r=xcHdn8+yU1=r9JmK0_3MCnQWdf8uDh=Tn1AGA@mail.gmail.com>
	<1498559907.7464.42.camel@intel.com>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 21:11:36 +1000
Message-ID: <CANwerB2qV6jEgUjzx6SGuWEYXFzPNo56PmmTJqHk5KnjA+O-AQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 11:11:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

On 27 June 2017 at 20:38, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Tue, 2017-06-27 at 20:24 +1000, Jonathan Liu wrote:
>> Hi Patrick,
>>
>> The original problem was that bitbake would print out the error:
>> "libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be
>> found in PATH. Please either install it, or configure qemu not to
>> require sdl.", if "libsdl-native" was in ASSUME_PROVIDED even if the
>> host has sdl-config in its PATH.
>>
>> This occurred really early for a clean build and bitbake would bail
>> out. The sanity check is in meta/classes/sanity.bbclass.
>
> I've not hit that problem, probably because the sanity check was not run
> again when I changed ASSUME_PROVIDED. I can reproduce it in a clean
> build directory without conf/sanity_info.
>
> I think extending HOSTTOOLS merely to satisfy sanity.bbclass is the
> wrong solution to the problem. It makes sdl-config available to all
> recipes, which is unnecessary and potentially introduces back host
> contamination.
>
> It is unnecessary because the qemu recipe has special code that enables
> the use of the host SDL when told to do so via ASSUME_PROVIDED.
>
> Can you come up with a better solution, probably by patching
> sanity.bbclass?

I can't think of any at this stage. Feel free to post a patch if you
come up with something better.

>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

Regards,
Jonathan

