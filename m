Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0101D74713
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 21:49:57 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id z5-v6so4514900ybo.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jqQztTptPGMNVEoaiFA5h5KXnrBgacki5cFONIR65DI=;
	b=LQuPCYkSIgHhjNfbv1yen+oPVDwPC1B7OFA0BMFNE1PBtebS2WfFop1Z7NJdW/E7TR
	HYtKjOwHzFKkltccm9AZPaUMGPMvGa9J+oTpFhZObFAyu+9HWcD9Xs0uKM0ILB6XXzM/
	mDd++wOT2awZ//lvhLOotcSJx59wSdQ1GGbRDa+8fkWef5jzH68pcIwO6sYqdGUuLnyv
	YeeL4rIS6Ih5V87KdHLT1r+WhHEsm2cs4pAr9Rmn4orUXFE6jselpo84kRTkOz8pfVj4
	e7J2QlSu9pklcGRff8Bw+nr8T2eeSkbWnFBxRXlICmTCg3xAzxZ1klIruOUBAHGZeOMH
	Ns4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jqQztTptPGMNVEoaiFA5h5KXnrBgacki5cFONIR65DI=;
	b=nLEy0/GM/tiEnifTrqRhcbOpw6tHm8HJkoBrtqzyCG1P6J8WwXXuhFVPLEEz0+QO5n
	QD/HoNd8MIomU4nYYgT+M9pQViQAAet9WnAhEtw17sMFUvDV2JndLwHf/bZyuYbK+pUw
	pplG/EwJJxrxx8OkKr0gKyK4brfbi8SgB6WsQenm+ABffzVtSSEmZLehZA8Ya092rRe1
	ajoRngLzFgUlLs7qDAUkS52EuHcH8rU2KN64meGtIVP50x3s9RwkMuk12quJkRB0XZyg
	UFnni+X2o36+DzoVE4j1jHy9vf4HjKMiL2dYSCd2UVe4zrsNRY50xqKhsqchABx7Kh0a
	xoWg==
X-Gm-Message-State: ALQs6tBhb0nLms3gGamTIOMJA2cct1M9ZN4h+pS7xnwJ2ZspA1WaO1R6
	vhzrXY6KJM0V1zWsJtfuJSzpSQ7OevdIlqN1W+I=
X-Google-Smtp-Source: AIpwx48ww00DBnE4grh3b+yPULo8pCozZk/AcQdiSktvYfeogzzWnv69949iXKKVbHPkuFqUhjPQVrvQDoRDfEPUyq8=
X-Received: by 2002:a25:d388:: with SMTP id
	e130-v6mr3951755ybf.224.1522619398588; 
	Sun, 01 Apr 2018 14:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Sun, 1 Apr 2018 14:49:58 -0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 1 Apr 2018 23:49:58 +0200
Message-ID: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: kernel menuconfig broken?
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
X-List-Received-Date: Sun, 01 Apr 2018 21:49:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

When running bitbake -cmenuconfig virtual/kernel I get a flood of

undefined reference errors. Am I alone here?

Cheers

Andreas

