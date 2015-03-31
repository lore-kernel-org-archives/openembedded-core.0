Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1545F7391D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 17:20:38 +0000 (UTC)
Received: by qgh3 with SMTP id 3so20611749qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type;
	bh=/tlRzYNglvnnt4s8XdzMAxhJwxuJYMqsb3Q0LQnpZqE=;
	b=uQN83YP+WpS/D28BS2Zw5yWJ5qSjdP1TSc9RSXsnI+O5ZAuFjkZlEiNV+lupbZbAHR
	ISPWkON0x0JGVb8JGRSjdZoH97EWupa7MyIMYkYZuRGhPuPGvxc2bVQJ4bv7Js6klzXD
	9MecHycuMlMxAzSF0zvgNXHIcUEhkIBpko3jPXh37mEvV+k0RAJ6u38jZKywdiCMfG6F
	2MZQgSxme05P+S351V5f7w2/8Fgsgy5+cmSkwLeSo72A1kFEHAGpX+EVaCqyponeCcdH
	UPGSaCdpBSwcGDEFRN1YYsOklcRBPluqhJqUkL4sWTGUbF6ulULXZVJtCkRTLDfYOoob
	bmLw==
X-Received: by 10.140.150.88 with SMTP id 85mr25905066qhw.46.1427822439925;
	Tue, 31 Mar 2015 10:20:39 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94]) by mx.google.com with ESMTPSA id
	b105sm10322764qge.20.2015.03.31.10.20.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 10:20:39 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	(Ross Burton's message of "Tue, 31 Mar 2015 14:50:06 +0100")
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
Date: Tue, 31 Mar 2015 17:20:36 +0000
Message-ID: <87wq1xgk2j.fsf@email.parenteses.org>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 17:20:42 -0000
Content-Type: text/plain

Hi Ross,

On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:

> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>
>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>     However, its content has the right ownership.
>
> Looks like a bug in pseudo to me, can you file a bug for that?

Sure.  Filed #7554.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

