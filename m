Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB876E8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:02:01 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id as1so2138182iec.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JmCOzqXWcIT6BHuWGhBlOX5ONsYPcvHyVlhal5RKnoc=;
	b=jxJbzwTi+V0EffjGt1AdeNGmty9DLNVhgbyF3TUAmEWEXi2PMZIO/ugqvoPei5DLx5
	y7MLSkJDBcAzFLMo9NKGSn9jHrTjCMwfai4CCKQxNtME08RYYv9+BCiake+dFAjNFWw7
	YQ/nUHALRTUFbzacEtP5ocp+eSM1MvPE35nvafO41J3hXbS8NhpWVz4bcQ+5Iz6PCOgj
	oToWD0G/TUZ2FadgLBkBAUjwcbblEa0XmkLuGL4uCEOJoXsV4pYSdeJgkZ6VmaKX0qqc
	RyS54DHGnv/34g8LNwiVtNa0WvLUTOq7RaASrDxpSGDpB8RL62mRIBrsEBy/Cp8yK1vr
	ssnQ==
X-Received: by 10.42.85.140 with SMTP id q12mr3364365icl.51.1392757321768;
	Tue, 18 Feb 2014 13:02:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 13:01:31 -0800 (PST)
In-Reply-To: <20140218205346.GA21359@mcrowe.com>
References: <20140218205346.GA21359@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 13:01:31 -0800
Message-ID: <CAMKF1sr1Aa86Bpbkas6rBh_XPQtLLeraHO17jMDtggsZUh7-7w@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost: Ineffective compileflags and linkflags in user-config.jam
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
X-List-Received-Date: Tue, 18 Feb 2014 21:02:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 12:53 PM, Mike Crowe <mac@mcrowe.com> wrote:
> or should users of this recipe be given a convenient ability to override
> the compileflags, with perhaps something like:
>
>  'using gcc ; 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" ;'

this one. care to send a patch ?

