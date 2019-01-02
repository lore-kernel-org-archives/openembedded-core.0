Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEF26010D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 11:48:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v15-v6so26774063ljh.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 03:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=FVre3ZeYVcmc5czXtSLstkv4R1Zj584jZI1DL1eJ21U=;
	b=ytSWhSZ8DJmxz61KapXPNVYEgvxwAb+jtNK7VxTizh2xq0ND2A28HUjw5+Ht+713P3
	BiTrsAMEAPe6zDMQkJ2EN7wNta247btMDhTxyy6Y3p7XdbZrSJwmuqtUfbWgAj7Ytrzf
	6nr9S/EBgv7DgKGRPVfHXvRDhniHZNQCMv3dXa8bBaO/IovGvTvzeV5p1knBAZKeVloq
	70uCigzFvc+ZeGLMdJl44nD4kXjm7eKOk1wTvYn1oEInFQLO4jqTuXNjcCu03eiDlu4m
	TDW1V+ZNuYQcQkY4tk2vOQD6NN/Ab0thBfVPx/4eolKNcHEcjn5mzV0exvoZbSyMybBn
	ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FVre3ZeYVcmc5czXtSLstkv4R1Zj584jZI1DL1eJ21U=;
	b=D6gAnrfKe0SrCC9fdfIweXKxWgKW4ccBEvTRE1DzA5Exahb+pwXCX77nF51N2Gj8Qi
	JtuoW3NbRFp4/3l/lA6tam3SCqSCbsEGrHK2mIX4lxtRzl2J+Q9qlV5ymC+OmgTRIuZO
	3Yb4AGb6Ae2O7qUP/XjTRtxC1HYxy8V/FOr6b1WAI6en3QjDHBzkfmcUpMYWJiZCCzT5
	vy7VyGUnqNQHCZhPUOBTxREy1J4idXl8qBMmnwWk8x4GvX/E728bby1Y398AVAyL9CS4
	Wid7rZGATLOxVSkvPSuCUqOsAjzazIntxwm7kdwbQtp8RbEko/XTwYNDnC98FZe7psX3
	bx9A==
X-Gm-Message-State: AJcUukcQqwtfrmIQq3MKBMJcSA8osUDIW+mTVMBhZ7XDn/0qIviwhEMI
	liuJWxw0KB4nDZXJUgP/4qGaAtukrds=
X-Google-Smtp-Source: ALg8bN5n0V7XhSgTYla+lWqxgeFes8QYtWADRvNCdSj6hzWMjL/v3PK7UuWE6VhvvO9EeLyrqYdOEg==
X-Received: by 2002:a2e:95c6:: with SMTP id y6-v6mr3636967ljh.59.1546429725172;
	Wed, 02 Jan 2019 03:48:45 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	6sm11087192lfa.27.2019.01.02.03.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 03:48:44 -0800 (PST)
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20181231120559.25470-1-jonas@norrbonn.se>
	<70bb07c3-1898-5a46-c6bf-ae788cfd7181@windriver.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <2f294ccf-5168-86b7-5967-4ce35d16ece7@norrbonn.se>
Date: Wed, 2 Jan 2019 12:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <70bb07c3-1898-5a46-c6bf-ae788cfd7181@windriver.com>
Subject: Re: [PATCH 0/7] systemd patches
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
X-List-Received-Date: Wed, 02 Jan 2019 11:48:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Chen,

Thanks for looking at this.

On 02/01/2019 08:58, ChenQi wrote:
> Hi Jonas,
> 
> I'd like to talk about this patchset from a non-technical view.
> And to be brief, my conclusion is suggesting using some switch, e.g. 
> DISTRO_FEATURE, to control this 'stateless' behavior.
> Please see details below.

OK, I agree, and this is part of the plan.  The patches in this set, 
however, are independent of whether or not the user wants a "stateless" 
system or not.  (My primary requirement is actually a "volatile" system, 
with just an empty /var, but the two go hand in hand so working towards 
"stateless" at the same time as "volatile" seems reasonable).

> 
> This patchset is based on two assumptions:
> 1) Users would generally want 'stateless' system. Or in other words, 
> they would prefer 'stateless' more than 'stateful'.
> 2) Other softwares/upstreams are also working against this 'stateless' 
> goal.
> 
>  From the current situation, both are not that true. As your [PATCH 7/7] 
> points out, even systemd defaults to install things under /etc.
> 
> Cleaning up systemd's /etc files while leaving other softwares requiring 
> /etc files is not that pleasant. At a minimum, systemd users who are not 
> aware of this 'stateless' concept would be confused. "Where's my 
> /etc/systemd/system.conf file?!" They would ask.

If providing the "example" configuration file that systemd installs is 
necessary, then I think it would be better to provide it at:

/etc/systemd/system.conf.d/00-systemd-conf.conf

If the user edits that file, it at least overrides the "system" version 
at /usr/lib/system.conf.d/.  The toplevel file at 
/etc/systemd/system.conf has the lowest priority so editing it does not 
actually override the systemd settings under /usr.

But this is all unrelated to "stateless".  This is mostly a matter of 
getting "distro" configuration out of /etc which _allows for_ stateless 
down the road, if we want.


> So I'd suggest using something like 'stateless' DISTRO_FEATURE (just 
> like 'usrmerge') to control each recipe's behavior.

So, just to outline how "volatile" and "stateless" should work:

i)  The user selects "volatile"
ii)  There may then not be any directories, links, or files under /var
iii)  For directories and links, we need to create entries in 
tmpfiles.d/ so that they get created at boot
iv)  For files under /var, we need to move them to 
/usr/share/factory/var and create entries under tmpfiles.d/

v)  The same applies, roughly, to "stateless", replacing /var by /etc

I've got all this working with some fixups to the packaging and image 
classes and "volatile" works fine if one does the above.  The proper 
cleanup that OE needs to do, however, is to actually minimize the 
content installed in the /var and /etc by the packages in favour of 
tmpfiles and volatiles where possible.

"stateless" is trickier due to needing to handle users, etc., but we'll 
get there.

But please don't get hung up on the "stateless" aspect of things when 
looking at this patch series.  These systemd patches are independent of 
whether or not that is the goal.

/Jonas


> 
> Best Regards,
> Chen Qi
> 
> On 12/31/2018 08:05 PM, Jonas Bonn wrote:
>> These patches make some modifications to systemd with the long-term goal
>> of being able to run OE in systemd's "stateless" configuration.
>> "Stateless" boils down to building an image with empty /etc and /var
>> directories so that volatile (tmpfs) filesystems can be mounted there;
>> this requires that the system subsequently be able to populate these
>> directories dynamically, which systemd mostly takes care of if things
>> are done right.
>>
>> In these patches:
>> i)    Don't include machine-id in writable images so that systemd can run
>> its first-boot machinery
>> ii)   Move systemd configuration files out of /etc
>> iii)  Allow systemd to dynamically enable services and populate
>> /etc/systemd/system via the presets mechanism
>>
>> There's a long way to go to get to a working "stateless" configuration.
>> Getting to a "volatile" system (just empty /var) should be easier and
>> I'll post patches moving things in that direction shortly.
>>
>> /Jonas
>>
>> Jonas Bonn (7):
>>    systemd: do not create machine-id
>>    systemd-conf: simplify creation of configuration
>>    systemd: move additional conffiles to systemd-conf
>>    systemd: create preset files instead of installing in image
>>    systemd-systemctl-native: simplify and support preset-all
>>    rootfs-postcommands: call preset-all for read-only-rootfs
>>    systemd: do not pre-enable services, rely on presets
>>
>>   meta/classes/rootfs-postcommands.bbclass      |  8 ++++
>>   meta/classes/systemd.bbclass                  | 33 +++++++-------
>>   meta/recipes-core/systemd/systemd-conf.bb     | 45 +++++++------------
>>   .../systemd/systemd-systemctl/systemctl       | 36 +++------------
>>   meta/recipes-core/systemd/systemd_239.bb      |  4 ++
>>   5 files changed, 52 insertions(+), 74 deletions(-)
>>
> 

