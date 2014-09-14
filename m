Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id D1E7465D58
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 20:22:36 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id m5so2943996qaj.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 13:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zjWrczsFzqy8zd9kChyqfqCMM+TacshpF8ujrdTHiXI=;
	b=GZTjjBVo6HkEilJBPpIPnJn2oGRYQxOsdNufdp48yEgAi9I5CVAC+UFDZ+qApul07k
	6vpgnnnEh+NWOCVEzSpP4JbPnyeUctePASlmrrvoIjkc3y2qjw8NSGqzlCzwuVbFKv0k
	sWNs5jEfl+hUo174iJshM9JUUaU4vLyphpJUvk3/pzki8u/c+E4cBLa5nA6P947LcuzZ
	cD00XT/Knc+rgB4X5Z0FmHMhsJBbrK0UgcelcZVtxvJ7zz3VsOHq9DQ/RYOAdjmwKIAv
	uarMKJrWPt5WUl1mgFHQv7hoErbWnstVFOHHTdIKbV7l07GCGXyxQkeyTHD5KI1Khvu4
	1Mkg==
X-Gm-Message-State: ALoCoQl9m4AbOdC6ZNBGJo0r64LMcdd/whU6j2Aqd/L5FcPLBFBRRZUpbZ3mUxWrF34JHRlBnr1z
X-Received: by 10.140.97.247 with SMTP id m110mr31202802qge.80.1410726156741; 
	Sun, 14 Sep 2014 13:22:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 13:22:16 -0700 (PDT)
In-Reply-To: <2f2f7278925f48a03507499180f2a85500b4b6c6.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
	<2f2f7278925f48a03507499180f2a85500b4b6c6.1410244514.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 21:22:16 +0100
Message-ID: <CAJTo0LYyYuNTWoJXA40aCX2Wj7Qkf7d-eUmUcbzTX71gUTUUcw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] busybox: install ping6 into bindir by default
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
X-List-Received-Date: Sun, 14 Sep 2014 20:22:45 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2014 07:35, Chen Qi <Qi.Chen@windriver.com> wrote:
> [CQID: WIND00444742]
>
> Install `ping6' provided by busybox into /usr/bin to sync with the
> iputils package.
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

I know there was consensus on the list that some vendor tags are fine
in commit messages, I think the LOCAL REV NOT UPSTREAM lines should be
stripped.

Ross

