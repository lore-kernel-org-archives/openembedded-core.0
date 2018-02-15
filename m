Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1969F780A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 07:40:49 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id f25so4272496qkm.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 23:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=bxJTyDhlOKXEMAIjITNHa4SzQFjQKC9RhkVQWT1KdsA=;
	b=O0rCep86yLVoWq3Ky+ycXsO0ZKSPNIiMYYJmwqSzBLMeE8qjytYJXmbgL29YDRydRP
	yL1YlulNXDhiC97c9Wjfy4i92L0S8TBC9y9PZ7een8fswXWe/p0zJYDC5owTRWJQALR3
	W3oOvyoOgWNgKZLV8L0IBafegg+1bo3hPfjEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=bxJTyDhlOKXEMAIjITNHa4SzQFjQKC9RhkVQWT1KdsA=;
	b=kNVJsXOcXHSynxQavbZFTS0Qv2W6Tk+DyUzA1xdg7wktszjHhxIoFgBJqtnJoI/4/H
	Xd05o70lqBW6dLSENlaswygx9NonRpL4Yeo7SSnepGJDDWCdO2lyZmk3uCW1xCbFOAge
	RnJXZjBGMhMI5yx/oK51tInsh6YXBLcA45kA2s0fe67T2acafFni6MLj+eSQ9MNM1tEg
	fmzhcqAXHQ9KhdRwSF0G/fhuNs866bgcoRnL3OmVZDjIYuJqxIw27GBweGplqCHci5qe
	xmGE0uU3yvPsd0e+kSvVOLHwgPaxh+lim0tcldwE/fx+m8MsaoUNB5qOSl+NpnpjHmxU
	e/9A==
X-Gm-Message-State: APf1xPCxWnK3xQmiFMhGUJR0uxGzfhP++thT1G9okaKElPZK5AoFEFOM
	+xE3atngmqjcwx5Q6iA/Xy384vfPaJr9SzhYxS9d6Bsl
X-Google-Smtp-Source: AH8x226s9iZ7rcnKcLDe2PPRw3L0Md7rxenUxpx/Ve46oZhd9NollUwq1Yf0/v7gcmY5IwRrO+pvbVSqBuxzBlj7XkE=
X-Received: by 10.55.209.12 with SMTP id s12mr2565968qki.219.1518680450622;
	Wed, 14 Feb 2018 23:40:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.170 with HTTP; Wed, 14 Feb 2018 23:40:30 -0800 (PST)
In-Reply-To: <CAP71WjygD3eM2fhhU5JG6Kn3_y=mH1fzy+aVrQFKtp+ED_yoog@mail.gmail.com>
References: <CAP71WjygD3eM2fhhU5JG6Kn3_y=mH1fzy+aVrQFKtp+ED_yoog@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 15 Feb 2018 08:40:30 +0100
Message-ID: <CAP71Wjzbtbe-ZTxxw13501y5veyNzam6QcqDFjoD03sxqVTjtg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Ryan Harkin <ryan.harkin@linaro.org>
Subject: git fetcher and github pull requests
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
X-List-Received-Date: Thu, 15 Feb 2018 07:40:50 -0000
Content-Type: text/plain; charset="UTF-8"

hi,

re-posting to oe-core list. While this is a bitbake question, I didn't
get any answer.. so I would like to get more attention from bitbake
users..

cheers
nico


---------- Forwarded message ----------
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, Feb 7, 2018 at 4:04 PM
Subject: git fetcher and github pull requests
To: bitbake-devel <bitbake-devel@lists.openembedded.org>, Ryan Harkin
<ryan.harkin@linaro.org>


hi there,

we've been debugging an issue these days on our builder which ended up
 do_fetch failing with

LANG=C git -c core.fsyncobjectfiles=0 fetch -f --prune --progress
git://github.com/OP-TEE/optee_test.git refs/*:refs/* failed with exit
code 128, output:
error: Could not read 48e440f5f8d033e1ace6e41f424ecf6e6d96e5f2
error: Could not read 019a8db54beb29388e1108831d2e2dc135c1cd73

It happens that these refs correspond to pull requests done on github
which existed at some point, but have been updated with newer commits,
and won't exist anymore.

the bitbake fetcher seems to be greedy and fetches refs/* which ends
up fetching pull request when fetching from github, e.g. in my
workspace:

in $DL_DIR/git2/

github.com.docker.containerd.git/refs/pull/66
github.com.docker.containerd.git/refs/pull/459
github.com.docker.containerd.git/refs/pull/551
github.com.docker.containerd.git/refs/pull/321
github.com.docker.containerd.git/refs/pull/60
github.com.docker.containerd.git/refs/pull/523
github.com.docker.containerd.git/refs/pull/40
github.com.docker.containerd.git/refs/pull/561

It looks inefficient to fetch and store on each builder pull requests.
I understand this is just because how PR are implemented in github,
but github is quite central, so many we should/could do something
about it?

Beyond the inefficiencies, we now are seeing unrelated build issues as well.

What do you think? Should we try to avoid fetching refs/pull/* from
github? or is it our git fetch command that needs to be improve to
work in this situation?

thanks
nico

