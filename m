Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id DF64C7F7DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 15:39:07 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 203so2751454lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=X40RQoBL2hqT7EUP4ERuLB8RrrNYS3qXXLsBE6wKKBg=;
	b=iJH/gHqRlMpX1pdeedy0v7iwfz+sC9Z86n0OKwduy+C0eJc552sKXLiPay5PDVdyg8
	o9pPlDjYMWX4aD4DBrhsSeBpVBXAtIebb0504oGUzSkqZ2cJRiAcpMTCZxPjBfg9u3GR
	rBwfL67OVGl5J/KUNiTSddc+UFp+HlmYkePnv1PvSrKVXJIfRQlMF3nq20svuUyuAEZI
	6hqIgYGI/GHmQAW81AUJY9dGwbD6OW00Y/Q9s5Upzg9kIRVqUEqFMvbe13zpWQemTGH/
	D1+LDTNMokM6/e3NYnz2wbLuRZ6ZLHGNdO4DPou5X3+yV0GNHV8D6n+LAQ4IdHfd9XBW
	Zr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=X40RQoBL2hqT7EUP4ERuLB8RrrNYS3qXXLsBE6wKKBg=;
	b=mHxf4aRbG9Su+rFvx13yZYOw8OYpRHIaS0FX9cjx4ASyNCh1VI+ftFov3gnSqbqtQm
	xVmcKYH84lSU12mrm/79FCyVOYcBqxPwODTGI4hkTYzmYcA5LlITkNChhg+Bl8phaEIf
	9GoI68j1RwSZKe8pIsoNjmLZKFFkQQZ9cPrsjYs9dlpeUUA9rCoMRsriEr4CCgJqBGbT
	6+02Gg31wfuqz3KCmNcM1YjF4oNAQb9rEaPqDnrMGpK2oN6T14xTrzpJ3X/EenyRKpoQ
	rbbs6XPAWYmZOHjNGk8i+OcRGJCnS96acCx0D6D/+CW6oElinVmVmCcuuxp7tPAbBRyf
	xtEw==
X-Gm-Message-State: APjAAAVmtPqib1C1KCFgVSWlQkiadKJD2Y8q7ZlnCY1nbarTbBoeUHE3
	xwfrNo6RbJt8kBMOcbz6bpwmvTR6C3ylHQtS8UtCTrlvMKw=
X-Google-Smtp-Source: APXvYqwKEI0Anju0sfad6vxb3/m/8UbpCt2K/u8N90RyX33BwHTgPIKxch3v9PRxe+JoneNiCzNDtN1Vn03UGvAbABk=
X-Received: by 2002:a19:f514:: with SMTP id j20mr2939591lfb.31.1578497948217; 
	Wed, 08 Jan 2020 07:39:08 -0800 (PST)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 8 Jan 2020 15:38:56 +0000
Message-ID: <CABPh3UPHV8GYZRxXBGXUQLvCqxJShvhU262xOQdEiH0kTPTSug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Scott Rifenbark <srifenbark@gmail.com>
Subject: Update layer compatibility to Dunfell
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
X-List-Received-Date: Wed, 08 Jan 2020 15:39:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,
is it time to update the layer compatibility for meta* to dunfell?

Especially because after change

    commit 9702544b3e75d761d86cae7e8b36f3f2625b68ce
    Author: Denys Dmytriyenko <denys@ti.com>
    Date:   Thu Nov 14 19:40:07 2019 -0500

    distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES,
    rename

a lot of recipes start throwing warnings.

The change

    commit 98e34b71ef54fdada2fdc199905f8f2dfae7e933
    Author: Scott Rifenbark <srifenbark@gmail.com>
    Date:   Wed Dec 11 13:02:24 2019 -0800
    poky.ent: Updated variables for YP 3.1

already changed the release name

Thanks
Nicola Lunghi

