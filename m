Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.9825.1611653098052649858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DQ1XZ2x0Kz5tlH;
	Tue, 26 Jan 2021 10:24:46 +0100 (CET)
Date: Tue, 26 Jan 2021 10:24:45 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] sanity.bbclass: sanity check for if bitbake is present in PATH
Message-ID: <20210126092445.q6gjzwloghpwyfrc@qschulz>
References: <20210126013400.9752-1-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210126013400.9752-1-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Tue, Jan 26, 2021 at 02:33:59AM +0100, Dorinda wrote:
> If a user executes the environment script instead of sourcing it, there's an error about an empty element in PATH. This is because bitbake isn't present in environment variable PATH. Hence, this patch adds a sanity check to verify if bitbake is present in PATH and if bitbake isn't present issue a warning message.
> 

Same remarks as your other patch for the pseudo related fix.

=> v2 + commit log wrap

Your patch also has [PATCH 1/2] but there's no second patch AFAICT, you
might want to check the content of the patch before sending it (you can
read the patch with your favorite text editor, it's just text). I think
git send-email also asks you if you want to send the mail with the
subject being "<insert commit title>" before actually sending it but I'm
not sure anymore.

Still only nitpicks so no need to send a v3 on my side.

Cheers,
Quentin
