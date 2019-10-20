Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB207D718
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 12:54:46 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p4so10814533wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=jgKg4Kf4LgDJ1RACondkh+YjuGNUN6AFN0PSjHZme30=;
	b=AS2CE86WxRtvsf/w7IPvSFzItrRosOxobhI8xvXQ9vvKJfqTSIuRNGvepepEiuY4Ig
	XSNRpSmznH6xMp9sI3xA6ITmTofl3SrqpiGWInAeZoQIxGXjhadEsgafH/5mZDF6TkrB
	88h3nAvZZYzO02ak7+UxvYBDQdpn7kWBr7Mfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=jgKg4Kf4LgDJ1RACondkh+YjuGNUN6AFN0PSjHZme30=;
	b=sih0ym7hREi6pMm4AP6LbQmzy+XM9WhuvheB1gRia6iBxhgq08w23XfU/lUyXM0M9V
	7eFjz4lQO5rFJ81Wf623rDdW7HJsfJrYjrJBhlp2pF4vqw3KFEQMOeSTNvCwVq9QYHu8
	ARSlhr19HJm623YymfS9ouRkxVvzLO7GeUZV7dmQ/6Qdk/PbKzevEHc1zU2LMy4SyGnU
	SEwuixSesV6A9N8rsS5CDY/ee/+Tgt/xf/2kE74t2UdETZkv4oO8DP2Jpn2r5wuKhGAr
	Waof+m2xajn6SL7/DHxqERF+SkWhEki7Gmre4Fi+Wv3NbhzYr+7zH9zoavCm3l5nTuJ+
	IXUw==
X-Gm-Message-State: APjAAAVxGRBzM0DSkoffjE+3/Xy+zUhWjCFRsWIIKI2ATKMI8Hha984q
	wyXJk6MtptknvxQum2dr6aefxFDZxUw=
X-Google-Smtp-Source: APXvYqwcFwoCeQNG9bB2ex3fNDX4aI0sNNjJtt9xyNAvPh0GTqPJ1sK5Sar5ZKifmCio9DC/b0Rz0A==
X-Received: by 2002:a5d:6608:: with SMTP id n8mr15798390wru.92.1571576087274; 
	Sun, 20 Oct 2019 05:54:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q14sm13788389wre.27.2019.10.20.05.54.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 20 Oct 2019 05:54:46 -0700 (PDT)
Message-ID: <b8921ea9bc7bad48a33b0a818d47e2ea069a1dc6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Oct 2019 13:54:45 +0100
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Help with intermittent autobuilder exposed bugs
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
X-List-Received-Date: Sun, 20 Oct 2019 12:54:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a situation brewing on the autobuilder. Each run there are some
bugs which sometimes can appear. Law of averages says one or more of
the issues below will now appear as we have so many of them. The
project's standard processes aren't helping to capture the issues or
track them down. 

With the release mostly sorted out from my perspective I can look at
some of the other health aspects of the project.

In theory SWAT should have filed bugs for these. In most cases they
haven't. If they did, we'd discuss them at triage, decide they looked
hard and then there wouldn't be anyone to "assign" to them so they'd
most likely end up on my plate anyway. I find it hard to know what to
do with these. I already have a load in my bug backlog which I've not
gotten sorted out so adding more probably won't help.

To summarise the issues [just from the last few builds]:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/756
oe-selftest recipetool.RecipetoolTests.test_recipetool_load_plugin
RP has a long standing bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13070
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1177
qa-extras2 step2c testimage logrotate.LogrotateTest.test_2_logrotate
for core-image-sato
[no open bug?]

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/441
oe-selftest devtool.DevtoolExtractTests.test_devtool_deploy_target
[no open bug, unhelpful backtrace from tinfoil]

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/440
oe-sefltest signing.LockedSignatures.test_locked_signatures
[no open bug or any idea why it failed]

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/440
oe-selftest distrodata.Distrodata.test_maintainer
[no open bug, same unhelpful backtrace from tinfoil]

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/440
oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
[no open bug?, fedora specific perldoc reproducibility issue]

https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/52
qemuarm systemd timeout parselogs error
"""Central error: Oct 19 11:21:48 qemuarm login[228]:
pam_systemd(login:session): Failed to create session: Connection timed
out"""
[no open bug]

Some of these are with master-next but I don't believe are related to
any issue specific to -next, its just because -next has had more test
runs.

I'm not sure what we do about this. The SWAT process really needs to
pay more attention, equally the people are volunteers and therefore I
try to be grateful for any help.

These issues are becoming more frequent and mean we lose confidence in
the builds which delays patch merging. People often ask me how they can
help, ideas on how we can move forward with this would be welcome...

I also know Armin has a difficult to debug selftest issue with warrior
which is blocking its release build right now.

Cheers,

Richard


