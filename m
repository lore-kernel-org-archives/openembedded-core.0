Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>)
	id 1R65hG-0007n9-Qo; Tue, 20 Sep 2011 21:09:34 +0200
Received: by qwb7 with SMTP id 7so1364218qwb.2
	for <multiple recipients>; Tue, 20 Sep 2011 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=FHuYGLbeL8OWIkMK/pTq1s94odiN3uZncUPfSsO7vnU=;
	b=wu/yVvpeeZwqUEnT3Aa+HuXyw7JpmAKuk2PNloyJEqWZI2bm5jeU++cbEzXA7/lSl6
	yHbJk97VddB4q+dlAFvuCNMklE1tQvfO8Jtq63bq/Ac8XaVWB3LttjWweERU8NBW/ag7
	2VHIvORAx5Oh3ihF03psb2TtbOblZt7wT26xI=
MIME-Version: 1.0
Received: by 10.52.175.229 with SMTP id cd5mr1132079vdc.363.1316545456507;
	Tue, 20 Sep 2011 12:04:16 -0700 (PDT)
Received: by 10.52.186.166 with HTTP; Tue, 20 Sep 2011 12:04:16 -0700 (PDT)
Date: Tue, 20 Sep 2011 23:04:16 +0400
Message-ID: <CALT56yOyp2VYEziGiZj4PLjYHFhTkxisKwWnP7_Uy69Cc1ufYw@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [RFC] policy proposal: INC_PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2011 19:09:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello, colleagues,

While debugging some stuff in oe-core & company I've noticed that
lot's of packages
either don't use INC_PR, or misuse it (e.g. .inc has INC_PR, but then
.bb just defines PR = "rX").

From my previous experience with oe-dev, I found INC_PR very usefull
and error-prone feature.
What about making usage of INC_PR a policy decision, demanding that
all new packages should use INC_PR for their recipes, if .inc files
are used. And then define a grace period
during which all remaining packages should be converted to INC_PR (3
months? Next release? I really don't know).

I'm sorry if this issue was already discussed somewhere and I'm
duplicating the efforts
or proposing already discarded idea.

-- 
With best wishes
Dmitry


