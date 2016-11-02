Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E40A671AC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 20:41:45 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p190so293249341wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=DRRvtdJDhj2iqMFPJ0JcWIENmsNF/KN8qAiyNc4C45g=;
	b=M0JoH+7MtBibSSX6pZAaZ8ex/sJwyNnHcCsAoaxW/oGpcC3cox2GSI/YfgIcmX8USX
	Z9n0gRI4TLY8lB3XnXXZ/AhtRN1Fgg7clOcnOY7cQsLMhvAMVW35mMsJkXj4IhBXLBqw
	4pz4WNxBpxxplsQ/2AmBAZluhmUaf2mimfC9eUXt6rgVq3LdtkW6Sk4NzakgbgGrBWqO
	5r5ZYPPfh1iPzx8fNMwM+vS+TKT3qQpaJ686J4DYIAhUqg6u0Nrekq+kcmCSgcm3CHvl
	XKc8zKiHzwxUlb3C7uasfyQp29KeKmQgF79reDy8uNZ4wRXandbwOY3aE4F/soSCuhI2
	tsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DRRvtdJDhj2iqMFPJ0JcWIENmsNF/KN8qAiyNc4C45g=;
	b=dbMAbn1wHRVIoCOfziv/0+1qQW4BM42vyWL7WRK/menWN5tjgSy04gUrGM787Nihyo
	FMXDGmq9cuWGx2rsNqcq7OlW4Rl4QwsXOzOPvaNUemtc9vImujUCPvXcgtPbL/dK6xKt
	dq+wlHIJhOQ8ONkTWf+Ss+WwIYx47L2WARR33MKbVZNJqBpBAYHjTalabJoVihxQzL32
	5WjOKMDehSp8dYtA/ddhzESIyp3fARCxVfd1qBHvIdZaKSBFblZbX+v/dBoGjVMENM6H
	g0fv4sVRfi41KRUkLMzy3/J+ZG2RMjIRFh/QosWoa1rm6Mfmfe9rCOPeKtCgTcJ2wwWk
	YEfg==
X-Gm-Message-State: ABUngvfFtL8dSzdK4j6SVUxiLfN+TcLnv6PZ26eQz4f4FmijLVX2k4Yp9nnedZ+z542ifuIM87n6qaaRwjaSRg==
X-Received: by 10.28.137.71 with SMTP id l68mr5404770wmd.76.1478119306271;
	Wed, 02 Nov 2016 13:41:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.155.103 with HTTP; Wed, 2 Nov 2016 13:41:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 2 Nov 2016 13:41:45 -0700
Message-ID: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: version of gdb in morty
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
X-List-Received-Date: Wed, 02 Nov 2016 20:41:46 -0000
Content-Type: text/plain; charset=UTF-8

It looks like morty (and master) are building gdb from git (ie cloning
a ~660MB repo) with the git revision set to a snapshot mid-way between
the 7.11 and 7.11.1 release tags.

Was that the intention? Or is there a patch somewhere to switch to
building from the official 7.11.1 tar file?

