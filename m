Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 69C5F7F38D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47bY7B3YFwzKY
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576435078;
	bh=6aQbs9p5pncFRNwfi7NkV5Ay5utW9A0Slv+jKPjX8lU=;
	h=Date:From:To:Subject:From;
	b=bU4uOITLZ/E6XJQqU5CkXO0LRDcWagvABCOvfamGWIWcSN+xNvYhb0fuhGk4kjNFu
	/j3xljF7Vuj2T8hdvgJUXqm1nCL6XSFgs7mGF11870Brhl/tejcPQO0OC4rEDs863n
	Vvi3wizhukQ3hJx95QQVEqYvPMA4BWKmvFlrXzkx19Y2xUZKDTGXlWMR8IqB4ROKyy
	sfKDrrTDh4ZrTaTg0ZzDuTFTR3yGesYOrzuBpB0TKf9+zBGFNE+hIwOfokIUoI9AZl
	5EvKM3YHZNEpKOTr4jdYTKuOTjiwrShas+NnCBgkpki46rLzAbN+I1IhEVrMIYLgxR
	EpoSqcM/m3g/PJNFLG1NGcL2nyMhAMPSuOBqMWengadn3kxhPkzoW7bY7UH1CMiwIi
	2MooOhWeplCn+G2CIosTzyxyGRYHsvfYIJ7qkjnECENovIKjOpvpHrOHzEYDdT/Mo5
	pp5OHA6jKWfGGs2xlvl9hwKflftuxEls8+Cp2cl1KL8Tk5TJvaqIYpow4qYG8geOIg
	a/j94MUeln1PK8xS5vc3kNWYHjI9mkIgWBEKkGKAf2myp/BUTlayPhNlEs0Pu68W6Z
	KTWyxmttge9IetzAL68rLgWPWPnmYq9v2I0zxguA+7vEkT3YUtAWdxwwWZQzvfBshk
	fMXna4KTIkhSoYL6+byyH9S8=
Date: Sun, 15 Dec 2019 20:37:56 +0200
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191215183756.GB14038@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Should patchtest warn on Upstream-Status: Pending ?
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
X-List-Received-Date: Sun, 15 Dec 2019 18:38:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I am wondering whether patchtest should send warning emails on
   Upstream-Status: Pending

In practice patches are usually forwarded upstream either at submission 
or never.[1]

Not upstreamed OE-only patches create a technical debt that often makes 
recipe upgrades a pain.

cu
Adrian

[1] When upstream requires copyright assignment upstreaming
    later is sometimes not even legally possible.

