Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <iwamatsu@nigauri.org>) id 1UHTrw-0002Yw-GJ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 07:48:28 +0100
Received: by mail-la0-f45.google.com with SMTP id er20so5680527lab.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 23:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:x-gm-message-state;
	bh=X+CtzikoIBI7Jvmvv5w/ERCDA5RUJUxpmtzX4YU2WIM=;
	b=jcoLi2hzInD0Ff8mH8cZCKd2EXfe99aD+QwR8B8m9tr/f1ZIgYOb4lY8njdbV+3HzE
	l4c3o5SWe9Y0/C+gPIMnPkuYTur/npjYGWnep8BEBnsh1eegh/rpRLCZID93dw0bCJPJ
	3zLVfaXeQBevYTRt8ncJrtgaCrudDy8U82uwVoyykHWfIPLPAFn2xgkbzuu+ZWv6L32K
	VduzJ+2jQaZGSDRGOskC3jTYxu89+sB3li+0bwweElqYJpMZNEy2inyiPWRwn6dTGvpm
	XxOoa/GiTROZDpoqB1DvtA4cnWJn2cMOeUvnu9Jhyi0zyS3sDdwb7cVYQUq6VCBsMcmD
	jzqw==
X-Received: by 10.152.133.130 with SMTP id pc2mr13215422lab.51.1363588300171; 
	Sun, 17 Mar 2013 23:31:40 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.152.104.107 with HTTP; Sun, 17 Mar 2013 23:31:10 -0700 (PDT)
In-Reply-To: <5144FA73.4040204@linux.intel.com>
References: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
	<CABMQnVKVnoMH1B1Ri-Qmjec30BFX1TaosGq0b1Hc641m3490hA@mail.gmail.com>
	<5144FA73.4040204@linux.intel.com>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Mon, 18 Mar 2013 15:31:10 +0900
X-Google-Sender-Auth: P3-F6BTTea0TH7C-YpgJOu0DQSU
Message-ID: <CABMQnV+bGtBD1B5xyKTzTE31Ss83r8oqKpY9sdPEtt0uHu5rGA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkbf6dnOaFj18q1jaFVr647zY1VcsskRoesVIfXEaLECn6rAhbPfS5w1i6L8Oj1y/6xH2TJ
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Update autotools.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 06:48:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Sun, Mar 17, 2013 at 8:04 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 03/13/2013 06:43 PM, Nobuhiro Iwamatsu wrote:
>>
>> Hi,
>>
>> When I build alsa-tools, I could not build this with following error:
>> ----
>> checking for i586-oe-linux-pkg-config... no
>> checking for pkg-config...
>>
>> /home/iwamatsu/yocto/alsa/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
>> configure: WARNING: using cross tools not prefixed with host triplet
>> checking pkg-config is at least version 0.9.0... yes
>> checking for ENVY24CONTROL... no
>> configure: error: Package requirements (gtk+-2.0 alsa >= 0.9.0) were not
>> met:
>>
>> No package 'gtk+-2.0' found
>>
> What kind of image/packages are you building, it's possible that your image
> does not have gtk+ included and it looks like alsa-tools should depend on
> gtk+.
>
> It might be better to add a PACKAGECONFIG with gtk+ for these instead of
> just removing them.
>
> You can see python-smartpm_1.4.1.bb as example of how it's done.
>
> Sau!
>

Thank you for your point.
I misunderstood.

Best regards,
  Nobuhiro

-- 
Nobuhiro Iwamatsu


