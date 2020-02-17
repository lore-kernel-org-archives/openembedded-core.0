Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4C789613D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 07:19:31 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id x2so4565451ila.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 23:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=nJ5k3uviOV3CkwTn6pvz49xVf4blTPT8fyjkGfJZMtk=;
	b=Icdccx3RjgTm4IBwS1QhkLokJa+iXLWgqCfmXL5f6i5c7y8ITQD2piMUO2CFi7gAPT
	ZvUFxD39Tp8fPnuykqNkdwZAGVWBI0QUR4yJCbm4PWPzXOczBK1xEKKd3v9rAcFTMiog
	c/HFsqtW7fl3c3h2dYZz+J7UjIM2EW6PjYpR0ekfQy8nMcO/PG9IFj8aZ3R+HUKbauqp
	33ERd+TyivdFu83Z2IMGsGZT2bm78auYuoDvd+uowWhThZS/r36TDBJU2DqXBIx5Q//R
	0biY74Jfz7yPh1f/e1wBWBzAa/FSV9Fc7Bhq1REF62urKdMMT1S5TpIF7RXB3rA3hGhp
	c15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=nJ5k3uviOV3CkwTn6pvz49xVf4blTPT8fyjkGfJZMtk=;
	b=bZjgvVHhxCUu6x74QAj9rnCH+4hupUDySuzjm4U85rJ0S0qy08pbOgF8J1gNmJS0GS
	j5QmtGlLQ0nAbAj04vDdSPrFODb+CKTSdP8JlE287gC2L1CrhCp+r5NyQChCliT0hPE7
	O93LvHqm14bazlwczVeISQ8vnZl9RkjWO4h0Peli7mpgNHN88t5stax4c8J+yhO8dwiL
	NjmALVslr5yciefqKQx0QOEcC44Dof9MJfXYDiYsUTAlgQe/2TA/mka66izdQm5uTaI0
	0uSw0kHly7kqYE7i6fE6rsv0bFFmXdyRwbrePFMJ8Qjyna/o0PO79phNdsPSY0RugoqM
	rW5A==
X-Gm-Message-State: APjAAAXqc2bZmPqKkD7NGcDJIvac4qZnqXHrn2dxPhd040DCtRWRXeMv
	i1rzs/Ou0r2e/c0p/J32vUcRKO0RbK3Ou5pksgbDU7qY
X-Google-Smtp-Source: APXvYqzRf1Sm9alGWRjseGlppxak5y39LI7xlRjV70+pVPtCEFcA4fXJD8L1kWspyqZvI0n1rgG4c4D0N/FXtJ+BOLA=
X-Received: by 2002:a92:5855:: with SMTP id m82mr13226817ilb.302.1581923971944;
	Sun, 16 Feb 2020 23:19:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Sun, 16 Feb 2020 23:19:31
	-0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Mon, 17 Feb 2020 18:19:31 +1100
Message-ID: <CAA=hcWRtFrgz+ad5-7FUBhN+VSdM0j9Mp=TFoEH95k9L8xXd=Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yocto discussion list <yocto@yoctoproject.org>, u-boot@lists.denx.de
Subject: Which parameters are shared by kernel and u-boot?
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
X-List-Received-Date: Mon, 17 Feb 2020 07:19:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Does kernel and u-boot both need be compiled by u-boot configure files
to include bootargs, mtdpars etc?

Thank you.

Kind regards,

- jh

