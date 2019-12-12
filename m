Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id CCA527F685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 20:17:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id w8so561974wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 12:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CLpJvs6apjg5Dtl7VKfOrhefrIZNt0sNWAhhs8M9MMc=;
	b=jQJFCMpC5nr+cdTOPfPHdmQ2EPyyQ4s+Sy65kHSczOJn73QYzbP1s0Ri7VhCd7CalZ
	Ki1PrLr7YBq61WnNDeSoZzW6jnt6JTXIchDKNf3tF5+ngMX+OOYbVV3v+raTHdAnFwbv
	NGd7hdRD5TKFvGoWJlzWUdiLn4ISZOD2evcWU0eWm+8l7D7Bp4jZVM04zcZYF0gALLG9
	/JGEBZozKIUaOlLA+hRd92wtg50DTm1ck8dMk25dD6rhTkZSn1vtLdiuOHaA2hzMqlGO
	SKZH+/IhMyRHnveEKW6+RuPxY+BY1hVKK9RcayNdJGGFiiAW1Gli4Mf/wvZd1DKHaP2t
	iRXA==
X-Gm-Message-State: APjAAAUuYDlBzHrHglUmgu034UqSC9/qWxDNlxtiIDt1jlqHtvs2LyLw
	5V6hkjoKWczA8s5MTQmD72WzEsc+
X-Google-Smtp-Source: APXvYqyKNXwS1v/9Js7Gz4B0UU/6DrXsNB4Ku9IWrWOTQmB55NonS6YgT1E5O2WDfOqH7XWzBYFT4Q==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr9108321wmj.54.1576181877472; 
	Thu, 12 Dec 2019 12:17:57 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id x1sm7215232wru.50.2019.12.12.12.17.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 12:17:56 -0800 (PST)
Message-ID: <03cc8dbc90e39b92e48384b060f936a74a2faf26.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 20:17:56 +0000
In-Reply-To: <1494667065.1274125.1576154956651.JavaMail.zimbra@savoirfairelinux.com>
References: <1494667065.1274125.1576154956651.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: rennes@savoirfairelinux.com
Subject: Re: Status of the NPM refactoring
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
X-List-Received-Date: Thu, 12 Dec 2019 20:17:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2019-12-12 at 07:49 -0500, Jean-Marie LEMETAYER wrote:
> Hi folks,
> 
> I am currently trying to update/refactor the handling of the NPM packages.
> [...]
> Is it OK ? Any thought ? Any advice ?

Three questions occurred to me on that whole subject... Mostly based on the
understanding that there are no recipes for
the dependencies, only for the
main package.

Firstly:
With your approach, can I force a different version of a dependency to be
fetched? I.e. a versions different from what npm would do?

Use case:
Let's say an npm package A somewhere down in the chain of my own (recursive)
dependencies pulls in version 1.2 of package B, but version 1.2 is unsuitable
for use, e.g. licensing issue. An updated, compatible, but yet unreleased on
npmjs.org version of package B exists (e.g. in github), with the licensing
fixed.

Can I pull in that alternative version using your approach, as
I believe there is no recipe for package C if I understand right, i.e. no
place to put the alternative URL.


Secondly:
Say I need to patch an npm package C somewhere down in the chain of my own
(recursive) dependencies to fix an issue with package C. Can I do that, as
again, I believe there is no recipe for package C where I could update
SRC_URI to include my patch.


Thirdly:
Will it be possible to handle projects that use angular natively in yocto
using your approach. E.g. have an angular-native recipe that will allow
running ng build on the code I'm interested in?



Cheers,
Andre'


PS: Points one and two work with my (updated) script that I had posted some
weeks ago here.


