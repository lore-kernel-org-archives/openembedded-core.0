Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0483072EA6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 02:56:48 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id b14-v6so755952vke.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PgSQI1gWXCeWscd2gyQeW5o1b+eJY6Inqtf4zH2L/GE=;
	b=kkAyr5iRILKl7UQXNxBRR1SML/bZwpQDbpM1zbGhExhO05oIYvK+VHDnJpgQoz2xSy
	MyZ8zx11J24JilAX3yXYczYECAlI7HS8acgdSd+j9bxwNVW2qf5zfNMS95kY0MsO2JwU
	YmwoXedwloi/MfsWNBt2IERFBnc2DMhX2FYe8FP+t2CNGGMJLibrGSwkIBtNfylCqxmv
	vRuRRc3wg2dQrY+zIzlpCUTokuLIjTYg7NlT9z2eE0xLxhnnCrDTpCP4oMZ3kaNloWJt
	puJaCBMIJnRzshE0+eg+WwgsJeT8XgUnY0cf/KY3Sl5XiJnZfNifynQfgSiw7qIYZiHH
	owSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PgSQI1gWXCeWscd2gyQeW5o1b+eJY6Inqtf4zH2L/GE=;
	b=GzPxj5qF4AHpj93v505ONppAn1KsnoKIeeW7GvrRLsRMXCb7RHQFZvUygem08E+jzt
	VEgiNh4kyRdXrUtDIYwNqXaz66OnAAeEkzsP2pgk27tYE+tMDdEyALzg+grrGbqfh38c
	oKv1xE+CUzE5EO+qhPBYPTbtKptrquHDM5Sx92MMhVEIElix4EgIaCw32aBeMDXb0rPs
	cXqjmaRpS3NlCdXIx1em5iT8ez6Patq79M6GoJau4e9EBT+Y5UMmDVGykZefULzPIls+
	BmRrQFLGqSuPGlRAwcokUG56rqJGqc+5OZOSWxHjjzjbFkcPzm/9eB/FWy706No1GkBb
	AsOQ==
X-Gm-Message-State: APt69E063daHFnfYcRWS1uMQKVnRWm1G5O4qxZrLXgYcHdlUmNSRbi51
	9Z0pIrWvhfvUH9qoYSyCzamK9zdVUcFoRyITh2QrSw==
X-Google-Smtp-Source: AAOMgpdpcoXUbAH6ab/fukNatxS3v5J5hPhFTwOrjNLN8bfJNZtEs73DHEa3zjPFbRFv/jFTwM3nj1H5Qvd5YLLyuaM=
X-Received: by 2002:a1f:9d12:: with SMTP id
	g18-v6mr10201042vke.5.1530327409452; 
	Fri, 29 Jun 2018 19:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 29 Jun 2018 19:56:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 29 Jun 2018 19:56:49 -0700
Message-ID: <CAJ86T=XP8oMmuxAvz15Y7aUxt9ZrvTjpUy8wUyPotgG8xpzTrQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: LICENSE for recipes with empty SRC_URI
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
X-List-Received-Date: Sat, 30 Jun 2018 02:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

There doesn't seem to be much consistency in the way LICENSE is
handled for recipes which don't need to define anything in SRC_URI.

 - Packagegroup recipes have a default LICENSE in packagegroup.bbclass
and generally don't define their own value, for reasons explained in:

  http://git.openembedded.org/openembedded-core/commit/?id=c04ae17f439ffd5fd70d8564430a94582e2cf688

 - Image recipes have a default LICENSE in image.bbclass but generally
always explicitly define the value again. A precedent for doing that
seems to have been set by:

  http://git.openembedded.org/openembedded-core/commit/?id=fb617bed6ebbb17ca9a14ea5985302b03311ccb7

 - SDK recipes (anything inheriting populate_sdk) don't have a default
LICENSE and must explicitly define one in each recipe.

Given that LICENSE is meant to apply to the sources associated with a
recipe, not the recipe itself, shouldn't all these cases be following
the approach currently taken by packagegroup recipes (ie a default set
by the appropriate class and no LICENSE in the recipe)? Or is there a
fundamental difference between these cases which justifies the three
different approaches?

