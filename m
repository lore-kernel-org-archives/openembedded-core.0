Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id A5E7460102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 22:08:11 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id 23-v6so518404otj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oewLOy/PEkUfiLSyc0xjTfBrR3Z3+gvCp4hMvfTdDmU=;
	b=XzuGWcwKTVdv8w2iyN+Z3SDFoOp7qC4uD7koKUzpIqXuikmX63uRf9eRxRggVAFD88
	Czsk7qTCwYVDhP09RFXmg4P9eLtzIK+XSyrz8KPvCmFmKwEHIkh6q7d7XcfAJGFLb9qT
	klTrEt5Vzo7s1lUQHZl6c+xJGhPMYQ75KubCq/PEA+Kv2PuEOI0rUdVA7IKIvswOaj+r
	Li6PY0TvzRhJxvidL/3WV2J+4W7tVgUX0+121Rx+1oCBeswuJ3WlqGuWobrXPueNx+bp
	Ed1/0qzpPS95UoLODWOXy3cTHvy7VmeO1Um3ETuMb02XilPaXEed3gstxW5iTBZvoyeS
	WuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oewLOy/PEkUfiLSyc0xjTfBrR3Z3+gvCp4hMvfTdDmU=;
	b=B9yVVxwmitJJje1NvEmudj0N/P2t0HHiljjJdXeLBYDmPpLKs0uKvjo/euIiHeds0U
	1XWJ6n7ffR7MUsx6uDlrqxehE3pOW3o653yvHzMXuMqAKTC+nqEpF7wT73ny27Ax+CbI
	4cAfvhMtK9YfhUjKhngFdXsZNE0jzCyDdPyMaJoT4s0AxvLUx+m7WUG4/0t5Hi1NBwwI
	iPHuhcx9t1f5M7FGfDznw1MSHzx5kfXCzUnY/wpua4MrMH8uM7wXD3zCTLg6gQKcYlLn
	bS0hAfyOcvCBg5E8233NcH8UXP5dDI+Jp/39w/hTHsx0qVcGbMu+Z+qmPvJq/03CUzPg
	h7eg==
X-Gm-Message-State: AElRT7Fc5VT5I4F+W4MgDFwhVxb9BGnfXD2/vET3e7ZfIuYZ5i1hlX7x
	dfw3Ocz0jLrRbZSBF06LWP9qpcegcVsT7nKRIsGe+Q==
X-Google-Smtp-Source: AIpwx4/lWZRizCfvLS2hZWYOMBPc3JY6424nXs0Eb52zkA7eIbc3M6/AsOrpKhBssqJjzpFxKaexWukhd7RoXgOIJIY=
X-Received: by 2002:a9d:70c1:: with SMTP id w1-v6mr758263otj.300.1522188492609;
	Tue, 27 Mar 2018 15:08:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 27 Mar 2018 15:07:52 -0700 (PDT)
In-Reply-To: <37126f1c8d7556686f55019a52265f0e1c85e2ff.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<37126f1c8d7556686f55019a52265f0e1c85e2ff.1522162765.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Mar 2018 23:07:52 +0100
Message-ID: <CAJTo0LYj9jF-oz9mDRXziiLC6xnS-A_q=EtG-T2aoVZ4H4pAkg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] linux-yocto/4.14: update to v4.14.30
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
X-List-Received-Date: Tue, 27 Mar 2018 22:08:11 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry but this is failing for poky-tiny:

ERROR: linux-yocto-tiny-4.14.30+gitAUTOINC+f8232ce8e9_40adf66d7c-r0
do_fetch: Fetcher failure: Unable to find revision
40adf66d7c45b8252a1d3f904b5027a495e41725 in branch
v4.14/standard/tiny/common-pc even from upstream
ERROR: linux-yocto-tiny-4.14.30+gitAUTOINC+f8232ce8e9_40adf66d7c-r0
do_fetch: Fetcher failure for URL:
'git://git.yoctoproject.org/linux-yocto.git;branch=v4.14/standard/tiny/common-pc;name=machine'.
Unable to fetch URL from any source.

Ross

