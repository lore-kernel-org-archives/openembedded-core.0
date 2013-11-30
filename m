Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 24B8A6AD31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2013 21:48:17 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wm4so11275827obc.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2013 13:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/De7CbE80szwNzUM24bcMEW8tCvyQKG79SVAoh2t0O0=;
	b=ZWkS0l/U9iv3smapXitNvjKR8gnOlqEU49GTJY42RbjvdFmK5scQ2HiwroW5FZNFZo
	NNvz7xZttBXCc2Q9K7wEVY1sQi4RzXgEGnOc8g1JRw/WBxLXdnuQaQontwDN3pMOkxbh
	XGzmQJkK5lLnceJGGycudAWggBtaMUsP/xuh585+e8mIU32vIOat46DPUSx+wWeM51ws
	hxFKQYM45FrAJGBLe845FUWlZtC14QpVaC9on+njaDc67xBaf/s9tOWvE+njoJqR6Zru
	UR9f+W7jFw7iPZbJeMIWR0/TOyrBZkVjKX6rC5oFKVroAG00qUTOoGdF9qpU7IczxQ18
	9/tg==
MIME-Version: 1.0
X-Received: by 10.60.98.168 with SMTP id ej8mr2514445oeb.45.1385848095658;
	Sat, 30 Nov 2013 13:48:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 30 Nov 2013 13:48:15 -0800 (PST)
In-Reply-To: <CAJTo0Lbdfn9-jRp1d=XTH+LD=aMg=wX70L4=j1RO5zRHiH8sKQ@mail.gmail.com>
References: <1385733065-13722-1-git-send-email-ross.burton@intel.com>
	<1935443.LMsZVW7734@helios>
	<CAJTo0Lbdfn9-jRp1d=XTH+LD=aMg=wX70L4=j1RO5zRHiH8sKQ@mail.gmail.com>
Date: Sat, 30 Nov 2013 19:48:15 -0200
X-Google-Sender-Auth: JTLxdwYE7CHfVbY9UE1YbXUxW9g
Message-ID: <CAP9ODKraYX65kcw6p2Ov2nevQSzy9qEji2EmbhKRwLtomxi+DA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4-x11-free: depend on ICU
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
X-List-Received-Date: Sat, 30 Nov 2013 21:48:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 29, 2013 at 6:10 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 29 November 2013 14:47, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> It seems like ICU might still have problems building for PowerPC. If that's
>> the case, we should probably be explicitly disabling ICU for that
>> architecture, right?
>
> From discussion with Richard he reminded me that the problem is where
> host and target endian are different, so this impacts more than just
> PPC (and not all PPC machines).  A quick look at the ICU documentation
> suggests that they have tooling in place for this so it's certainly
> worth checking that this is still an issue.
>
> That said, this is simply enforcing the behaviour that was pretty
> consistent before as harfbuzz and beecrypt were both causing ICU to be
> installed.

This should be backported to Dora so we don't have it floating there as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

