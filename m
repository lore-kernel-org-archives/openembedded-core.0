Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0148671C42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:47:51 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id f24so406616qte.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PIb22clLXuftMrk3Ad4poAgpiUwoJ3c0dJe0yCXThB0=;
	b=dhgJstOJNwkQKjPooYD0dpB5VgzSfqkAbfwTgW/6vhyQxuKGokkaTqVfmo7Mr/mAwO
	cOOlX3oiL9Uy4+GM/04mQT9QsllFDDBNMzJrCDPoh6f1cFm+WF0LKP9RTYgBubPjmtY7
	EKTHOesnum3LV8/KTi7rwsDfVzP6Hbr+f77wF2nLIKwVjpHc0YtXbk21qGMWHzi5EQo3
	vfKxkKfHFniFj2sCtOu8G99RiR6/qDz4jJ6SXnDIS8w4QtTCd9FMpeZxosBOw2Tj5puo
	bq1faBcXn9/7Yrlcdu8HJYxzpds3ozMyqUcFiH6BOIielN6z3bs6SbTfvxlyagn9dL4Q
	BPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PIb22clLXuftMrk3Ad4poAgpiUwoJ3c0dJe0yCXThB0=;
	b=D+6B1vlSYYaBUbv2l8k1k8B2WtgHRUtlp/T4XoSA+UNFV1YtfRlvcnkeOCI35xwGdV
	F+fmZeknIdA0xaoHMXqYTkDnwarf8XV/QMvXaTpCly5QBFr1qNSjFPUu9sLVKUPLOyTJ
	Rb+qGwwutG5W1/kv/0Y/6fCUoHiSW2dyhae8WIN+fMHQcR5aSOrjVqeiNlFS8TyoPlb8
	vH8S4t7NX/ssMyyOogL0AmJT17/RKoitkwHiA0GraiBdJiCKaYZa9WQOzXoKBGE2G61A
	1MHBujaMWeJv/+vZQJqKfmUG/oULDzo46eIP3GnoHuBtc7uMSVj/nz8lMrkyq97/FLRV
	+sYw==
X-Gm-Message-State: AHPjjUiJtHjyjzbS1/eID8VO64QU4lnK3jGhuLnt9ouwvd1LebezDIVa
	ou8bBrB8pnYoC4/MZXtILHOGcIr977nN4mOoz7y5Sw==
X-Google-Smtp-Source: AOwi7QAnnc0CjWdxunlSP2BLuFe2IsvOMqseq+uFdqC2D8C85qDCmyk+Aur8tYgdiZab/P/5Z72xBsR4WCOGaTS1NW4=
X-Received: by 10.200.26.249 with SMTP id h54mr3485953qtk.41.1505843272922;
	Tue, 19 Sep 2017 10:47:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Tue, 19 Sep 2017 10:47:52 -0700 (PDT)
In-Reply-To: <77f7a9e9-0c3e-2b82-b9e9-a105625b29a2@linux.intel.com>
References: <20170915142039.4855-1-alexander.kanavin@linux.intel.com>
	<bde8ed04-c337-e6ff-2ced-7997b64c6519@linux.intel.com>
	<CAHUNapQmRab5qoOYLiPbKapkunAfwkxUOak5PRw1bxYHvFTn_w@mail.gmail.com>
	<77f7a9e9-0c3e-2b82-b9e9-a105625b29a2@linux.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 19 Sep 2017 13:47:52 -0400
Message-ID: <CAHUNapS-HqCE8CY1dw-bLszsSBQ9H3R-mBLLNXbRtG9BURmRFA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: use epoll API on Linux
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
X-List-Received-Date: Tue, 19 Sep 2017 17:47:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 7:20 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> and with
> Jussi Kukkonen no longer involved in the project

This is sad news :-(
So long Jussi, and thanks for all the recipes

