Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnIUJ-0005jW-1b
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 00:30:47 +0100
Received: by lami14 with SMTP id i14so2511880lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JWV8GN2cdiiIjvjem2OlxzNMsAg5T1LThR1+13F1BtQ=;
	b=WMB71HFwHMvwXrPz3Ii3l8a+Hz12cNL39vcJCnk1rZEeCxaFYqWNR4mzEcvJPv4c2D
	0RVGLgoLh4ILtQRaaGouXn1BultLxgFhvwYSjcg06tdkWRkQV6et0cyjcqchx55bzJPQ
	6WNSCgYf6VGgzDya5QwowIkSAznselDfhKgNE=
Received: by 10.152.145.165 with SMTP id sv5mr9202767lab.29.1326842589407;
	Tue, 17 Jan 2012 15:23:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 15:22:38 -0800 (PST)
In-Reply-To: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 15:22:38 -0800
Message-ID: <CAMKF1sriceDbz_scyB-TthDOWEzK+t9i0wgEJ_No=v_NF18JjA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
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
X-List-Received-Date: Tue, 17 Jan 2012 23:30:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 17, 2012 at 12:30 PM,  <nitin.a.kamble@intel.com> wrote:
> This recipe is needed by guile.
> And guile is needed for autogen.

is this really needed by guile. if yes what part of guide need it ?


