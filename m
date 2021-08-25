Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.21885.1629926863270914162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 14:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=47264 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mJ0Qv-00030P-DZ; Wed, 25 Aug 2021 17:27:42 -0400
Received: from [136.2.32.182] ([136.2.32.182]) by crashcourse.ca (Horde
 Framework) with HTTPS; Wed, 25 Aug 2021 17:27:41 -0400
Date: Wed, 25 Aug 2021 17:27:41 -0400
Message-ID: <20210825172741.Horde.jIEgB_nsmjiBqRKP9mvFgOd@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
 <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com>
 <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
 <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
In-Reply-To: <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Phil Blundell <pb@pbcl.net>:

> That's testing for offline installation. If $D is not set, it's  
> running on the target.
>
> p.

   right, that's exactly what i suspected in my original posting,
i just wanted to make sure, which raises a couple issues.

   first, that distinction doesn't seem to be mentioned in the
docs, so i'll ponder writing something.

   second, is that simply an old form that would be superseded
by using "pkg_postinst_ontarget()" instead?

   anyway, more questions later as i work on some lengthier docs
on this.

rday

