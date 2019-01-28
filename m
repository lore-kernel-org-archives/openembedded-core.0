Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 542687C4AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 16:29:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v13so18730568wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=utmUDA1BAREOlLXfOzPw9J1PJHTmvlWCttN2JSa8+Qk=;
	b=HwsyqjS29fnnoNnVFqxZ/v7x1hqeqUiDVF5H2Mt0iEvzqh2ZTf6vts2Sa/JepHrGtW
	EMeQ//tbLHV2tlpSL/XcmOjeE+wyGy/yuD/7eVut9S4K3uzodvYlYTqeuI5AQ5j5CAN1
	e615B4UNfXnmR/ALEQfrKtVruFoj9LFwhEKzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=utmUDA1BAREOlLXfOzPw9J1PJHTmvlWCttN2JSa8+Qk=;
	b=SGN4GNfcw2iJ+jUKkSZDO1xuDlpIp5yeuBd3meQkGKQzf5sAjAfmCH3XzMzxtThYqA
	lh/t2ZbO2q9C+6b8mQWmSn+GNSPQEYrtbbMaUOG/Hk1tfk3/hRV8gciKHNFFEsrrxy6C
	CAtfCvy8zLBKcqVO1oefhrRTEbEhK1iT4TOhYeZDVQko86BQifWwLESuXqzpvjdV3JbI
	SMu5DB/PFDQCDqdtHKEW5f5xgs2aOJkR9QtNLN5AP4FiD/G1fMCR6wPqjckRKN/NGmhc
	7FkcPrblvsKvB/dajKlMeUYVF2Rylxn+5zS/Dc8P3BTJ0zWjvQk0ZCjmW3pojHHHj/dw
	3dJg==
X-Gm-Message-State: AJcUukdsFOaB27PmqLa7Kas2WjI1tcTvMAZKuyfI8581M2mypk/znder
	nMq1QCWzpxwJffzyVzmfZ6JZTQ==
X-Google-Smtp-Source: ALg8bN4KfXvn5/m7bYkeYqGQSaa13BzLpY+1jUIK8Jf7jUKiMEW8H5qtEKnpeM3mALMIi5ffkO1NUg==
X-Received: by 2002:adf:94e4:: with SMTP id 91mr23518323wrr.322.1548692971950; 
	Mon, 28 Jan 2019 08:29:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v133sm62912329wmf.19.2019.01.28.08.29.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 28 Jan 2019 08:29:30 -0800 (PST)
Message-ID: <2e5c9d2f2ab6da1386bb73e7099371779422dec4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2019 16:29:29 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04348170F12@PGSMSX109.gar.corp.intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
	<1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
	<700a4fa3049746740929c83f6a61bdd5180404c3.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04348170F12@PGSMSX109.gar.corp.intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 1/2 v5] resultstool: enable merge, store, report and regression analysis
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
X-List-Received-Date: Mon, 28 Jan 2019 16:29:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

On Mon, 2019-01-28 at 02:12 +0000, Yeoh, Ee Peng wrote:
> Thanks for providing the precious inputs. 
> Agreed with you that the current patch that enable files based
> regression was not enough for other use cases. 
> 
> From the information that you had shared, there are 2 more regression
> use cases that I have in mind:
> Use case#1: directory based regression
> Given that Autobuilder stored result files inside /testresults
> directories, user shall be able to perform the directory based
> regression using output from Autobuilder directly, such as below
> Autobuilder directories.
> https://autobuilder.yocto.io/pub/releases/yocto-2.6.1.rc1/testresults/qemux86/testresults.json
> https://autobuilder.yocto.io/pub/releases/yocto-2.7_M1.rc1/testresults/qemux86/testresults.json
> https://autobuilder.yocto.io/pub/releases/yocto-2.7_M2.rc1/testresults/qemux86/testresults.json
> 
> Assumed that there are 2 directories storing list of result files.
> User shall provide these 2 directories for regression, regression
> scripts will first parse through all the available files inside each
> directories, then perform regression based on available configuration
> data to determine the regression pair (eg. select result_set_1 from
> directory#1 and result_set_x from directory#2 if they both have
> matching configurations). 

Yes, this would be very useful. I suspect you don't need to have
matching layouts, just import from all the json files in a given
directory for the comparison.

This way we can support arbitrary layouts.

> Use case#2: git branch based regression
> Given that Autobuilder stored result files inside /testresults
> directories, user shall first store these directories and the result
> files in each git branch accordingly using the existing store plugin.
> After that, user can used the git branch based regression to analysis
> the information.
> Store in yocto-2.6.1.rc1, yocto-2.7_M1.rc1, yocto-2.7_M2.rc1 git
> branch accordingly
> https://autobuilder.yocto.io/pub/releases/yocto-2.6.1.rc1/testresults/
> https://autobuilder.yocto.io/pub/releases/yocto-2.7_M1.rc1/testresults/
> https://autobuilder.yocto.io/pub/releases/yocto-2.7_M2.rc1/testresults/
>  
> Assumed that result files are stored inside git repository with
> specific git branch storing result files for single commit. User
> shall provide the 2 specific git branches for regression, regression
> scripts will first parse through all the available files inside each
> git branch, then perform regression based on available configuration
> data to determine the regression pair (eg. select result_set_1 from
> git_branch_1 and result_set_x from git_branch_2 if they both have
> matching configurations).
> 
> The current codebase can be easily extended to enable both use cases
> above. Please let me know if both use cases above are important and
> please give us your inputs. 

Yes, I think these are two key use cases we need to support.

I think there is a third thing we also need to look at:

It would be great if there was some way of allowing some kind of
templating when storing into the git repository. This way a general
local log file from tmp/log/oeqa could be stored into the git repo,
being split according to the layout of the repo if needed.

Our default layout could match that from the autobuilder but the
repository could define a layout?

As mentioned, we also need to think about ptest. Currently the runtime
ptest code has some parsing and log generation code. I think pieces
like:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/tree/meta/lib/oeqa/utils/logparser.py#n101

and the log_as_files() code should be moved to the reporting tool and
that the test code should just generate the json results file which can
later be parsed/processed as needed. I did post on the list earlier
about some of the other challenges we have with the ptest data.

buildperf is the other piece of this which we'll need to think about.

Cheers,

Richard







