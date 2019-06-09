Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 584847E511
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id bi6so2228577plb.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RHBJkA2gih0TdWH1gu9J28KcTu03DfXAzdGXmAW1/cQ=;
	b=MUq/2hjYH7Up2ecA0Mhp5V/XreWsTDqMfs2CALm+a+49EMFNZR1cO5PZXl61FA91Vb
	x+oV3ZqrCBff/n6pE+1LuyeK4+eUX/Y/p66daWC1DX0yuraYwOnyI2gIVn86H0tPGpk2
	xS5bPW1CjL5rekUmm3ctY4v+iYFryUqkBPf9xZo4EnX0HLVQKvJ0qOr2BTpNAIOJTAM2
	F7EI1oIUiF15VrFsvAFXM8EDos5DWriz0DFQx88TeLrMqipzEEq1H/FTHYivN3DwN3eq
	2ssJ1iB3GGjzqaS1SMHRkOkwPN2NRr4SEAXeRJWWms+BldL/jZcAu3qnM8qhmE9r/bNi
	BAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RHBJkA2gih0TdWH1gu9J28KcTu03DfXAzdGXmAW1/cQ=;
	b=ZJrB6dRDgoJmHg06zt5iRorWyUqUy3kDKtOtGiEqHbrCYfqChCClxgibt9XhXn8l4A
	rKt+TtsFtTfH/DTwwOOSMTqPsM3LwikF1rNaB1XsnZ64/06pg+z3A3rnllZKFVGKfhyo
	xIeW5k9k7czZEnSKcqfCxOkfvqBxW4oAfuGSyy1s6feMdCneJsGK+4Fza7drKyX7VbFx
	N7yAmEPYL3eNM3+ADGqr9baRUCLMjK3RPJz26r3/1G5MUHR62ZXMV0MGu1BWVyTQxVsD
	2jl4xaPCbw2t3aOecIGISO99/bB0Ral2ljsYWVK+ETM7jUkIkLCFmR+OTjjBqirH1V7l
	fzbw==
X-Gm-Message-State: APjAAAVmYe8nKhTCBWWpJKiO5ocHCvPMjxCisnuexcqtxDuGYq337Gaa
	pWRbmCMGLMGuX0Wj8kN+vM6pN7Je
X-Google-Smtp-Source: APXvYqyn9U2scugdXTO6R+elDgoUjmKN0HJTyoxNPtlQP8ZpfidQGbCaPFBTu0+TbyS+9BoWggHYhw==
X-Received: by 2002:a17:902:76c6:: with SMTP id
	j6mr41124485plt.263.1560092056394; 
	Sun, 09 Jun 2019 07:54:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:47 -0700
Message-Id: <ce68c55491df9bd092628ecfc4579f75d72ed62c.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 12/27] lib/oe/reciputils.py: support character `+' in git pv
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:15 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

While pv contains char `+' (such as ncurses 6.1+20181013),
it was incorrectly converted to `6.1'

In this commit:
- Convert [^\+]* to .*?
  Support pv to contain char `+' and not greedy match
  (Such as ncurses 6.1+20181013)

- Add [^\+] to sfx match
  Support sfx contains extra chars between `+' and `git'
  (such as asciidoc "8.6.9+py3-gitAUTOINC+618f6e6f6b")

- Make sfx and rev greedy match

Run `devtool check-upgrade-status --all' in poky and compare results,
only one difference on ncurses version:
Without the commit:
INFO: ncurses                   6.1             6.1+20181013    Hongxu Jia <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835

With the commit:
INFO: ncurses                   6.1+20181013    MATCH           Hongxu Jia <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 4ca200d..874b99b 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -932,7 +932,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
     sfx = ''
 
     if uri_type == 'git':
-        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>[^\+]*)((?P<sfx>\+(git)?r?(AUTOINC\+))(?P<rev>.*))?")
+        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>.*?)(?P<sfx>\+[^\+]*(git)?r?(AUTOINC\+))(?P<rev>.*)")
         m = git_regex.match(pv)
 
         if m:
-- 
2.7.4


