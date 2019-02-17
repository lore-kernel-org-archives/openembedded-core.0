Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 05F806C108
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 16:09:58 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y185so10319185wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Wjyrrcqh3yf3nv0xB7sy7HXLEJeUy4FPYt03MCe2BPM=;
	b=ihMsDtGTEr8d7GC5igh+WSUaktPBkfwdJgaqYZ2GMgBH5GRpgOQIBzw3ZY1lXbFyGJ
	EqeHBjpGxVgDSOFBAeg50wuWzM0Aq21WsTLhXiJiefOUFN8OOTGXe4JSQddGm2ajWEoq
	gVimruf9oeGYgCRfbpG2wikhnVbvQkJ6sX85U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Wjyrrcqh3yf3nv0xB7sy7HXLEJeUy4FPYt03MCe2BPM=;
	b=YD/mwX3+FuHw85biMXtRUOh/UrQRNPHOyLPAaf309TqtBtG62LjeGUjH/78DLpLNDG
	IXxlJ2OuLaSTtIImQ0Mg1IeAldopDQrXuho1N+9iXRbg7XMMAFeYut8xBc4X2+CXAhdy
	tiFNvJeCXqyqKRLf8aO1HcVxNJM0kRoa9jUBQqJKyNVkVbONOUU4dfQP+7JOGv2F6RVb
	BxkxCqHNEa3TXBgqJElGaq+m/oVFrz2PJQ8ogKogSxqeQtIZ81Q5gUdgphW0OLw1JheR
	QT+WwcB/EAAzGPAFN4txeJk34r/wrDZgJVP3144RUBI6GiWYnAOG9cK7PjmllCOE0Qdk
	JFow==
X-Gm-Message-State: AHQUAuYp42mYkapTz6uqz7oneXuwPTF5ZWMUJLOTLQ9X9f7i8QuBRA0g
	/FzZyvQC4m8p9O+RwRJKbHQuQA==
X-Google-Smtp-Source: AHgI3IaVMEI5kUwu3ieq5TcSt1cl6b2m4kiOfVxdVfVNNogUZXSFucIUCZeuw/YhwT2NYkKzI5KjnA==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr11040463wmg.144.1550419799394;
	Sun, 17 Feb 2019 08:09:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m16sm8985463wro.78.2019.02.17.08.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 08:09:58 -0800 (PST)
Message-ID: <f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 16:09:57 +0000
In-Reply-To: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Sun, 17 Feb 2019 16:09:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-14 at 13:50 +0800, Yeoh Ee Peng wrote:
> v1:
>   Face key error from oe-git-archive
>   Undesirable behavior when storing to multiple git branch
> 
> v2: 
>   Include fix for oe-git-archive
>   Include fix for store result to multiple git branch
>   Improve git commit message   
> 
> v3:
>   Enhance fix for oe-git-archive by using exception catch to
>   improve code readability and easy to understand
> 
> v4:
>   Add new features, merge result files & regression analysis 
>   Add selftest to merge, store, report and regression functionalities
>   Revise codebase for pythonic
>   
> v5:
>   Add required files for selftest testing store
>   
> v6:
>   Add regression for directory and git repository
>   Enable regression pairing base set to multiple target sets 
>   Revise selftest testing for regression
>   
> v7: 
>   Optimize regression computation for ptest results
>   Rename entry point script to resulttool
> 
> Mazliana (1):
>   scripts/resulttool: enable manual execution and result creation
> 
> Yeoh Ee Peng (1):
>   resulttool: enable merge, store, report and regression analysis

Hi Ee Peng,

Thanks for working on this, it does get better each iteration. I've
been struggling a little to explain what we need to do to finish this
off. Firstly I wanted to give some feedback on some general python
tips:

a) We can't use subprocess.run() as its a python 3.6 feature and we
have autobuilder workers with 3.5. This lead to failures like: 
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/242
We can use check_call or other functions instead.

b) I'd not recommend using "file" as a variable name in python as its a
keyword, similarly "dict" (in resultutils.py).

c) get_dict_value() is something we can probably avoid needing if we
use the .get() methods of dicts (you can specify a value to return if a
value isn't present).

I started to experiment with the tool to try and get it to follow the
workflow we need with the autobuilder QA process. Right now I'm heavily
focusing on what we need it to do to generate reports from the
autobuilder, to the extent that I'm ignoring most other workflows.

The reason for this is that I want to get it merged and use this to run
2.7 M3 testing on the autobuilder. The other workflows can be added
if/as/when we find we have need of them.

I ended up making a few changes to alter the tool to do the things I
think we need it to and to improve its output/usability. I'll send out
a separate patch with my changes so far. I've tried to summarise some
of the reasoning here:

* Rename resultsutils -> resultutils to match the resultstool ->
resulttool rename

* Formalised the handling of "file_name" to "TESTSERIES" which the code
will now add into the json configuration data if its not present, based
on the directory name.

* When we don't have failed test cases, print something saying so
instead of an empty table

* Tweak the table headers in the report to be more readable (reference
"Test Series" instead if file_id and ID instead of results_id)

* Improve/simplify the max string length handling

* Merge the counts and percentage data into one table in the report
since printing two reports of the same data confuses the user

* Removed the confusing header in the regression report

* Show matches, then regressions, then unmatched runs in the regression
report, also remove chatting unneeded output

* Try harder to "pair" up matching configurations to reduce noise in
the regressions report

* Abstracted the "mapping" table concept used to pairing in the
regression code to general code in resultutils

* Created multiple mappings for results analysis, results storage and
'flattening' results data in a merge

* Simplify the merge command to take a source and a destination,
letting the destination be a directory or a file, removing the need for
an output directory parameter

* Add the 'IMAGE_PKGTYPE' and 'DISTRO' config options to the regression
mappings

* Have the store command place the testresults files in a layout from
the mapping, making commits into the git repo for results storage more
useful for simple comparison purposes

* Set the oe-git-archive tag format appropriately for oeqa results
storage (and simplify the commit messages closer to their defaults)


Despite my changes there are things that still need to be done.
Essential things which need to happen before this code merges:

* oe-git-archive is importing using the commit/branch of the current 
  repo, not the data in the results file.

* Fix the -t option to merge command

* Audit the command option help

* Revisit and redo the way the git branch handling is happening. We 
  really want to model how oe-build-perf-report handles git repos for 
  comparisons:
  - Its able to query data from git repos without changing the current 
    working branch, 
  - it can search on tag formats to find comparison data

* Add ptest summary to the report command


Things which may be "nice to have" which can come in the future:

* Make the percentage vs. count in the report a commandline option? 
  (not sure but I wondered if that would be better)

* Add ptest sub-command to extract log data

* Generate HTML report

* Generate graphical ptest result charts


I'd be interested in your feedback on my changes and hope you agree
with them! I'll continue to work on some of the above items as I'd like
to get this merged sooner than later. If you're going to work on any of
them let me know first. I'll try and keep 
http://git.yoctoproject.org/clean/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222
up to date with my changes.

Cheers,

Richard


