Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id BA8177872C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 16:16:23 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id r68so7527246pfe.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 08:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=aB8jm7Pa5vTf20aDGU8AuVDc2HB2U+hpENeITeLPQyI=;
	b=FD8KCYunCJE1NWz5dIMNQDduUKZ38NmQ1PAddv00N9Ej8y/7iq03eQjLLikJeQsegs
	6kyX2OtPniRgBDDbJSAa9cmDvQt+VF0gsDOMt2RdqWi1WxLl6cM22XBZlyf+cON7AdMD
	gQF8lESh5VFs+9V6584Tpvcg3xA9UrDLF09geQ/iz5DMo9eBhBerFwIkV9/qqKNyl+do
	XTMZ4uZFh01HgsaWrhoaYAzbZKSRVpaI540YlHukL/jyy0B+ZL3YYukXKm/jv8X8HxY6
	HU6x58DZSiXI4AxqDaT1M/pqa5Cu9M90o73P8Vd/EJTr0tzUGQSUxzJHF8Ig0MT/0rzZ
	kp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=aB8jm7Pa5vTf20aDGU8AuVDc2HB2U+hpENeITeLPQyI=;
	b=YNLg0jBJgMPq7vBrjAzxPJfpBKzdkEKhulrUXVCVnypjeeJCWZf0cEFj+3vockzGJg
	o08oXXwiqN39mgFrcmvBFpvtpRs4JXa87gfCdHMsqibtbfWuLSKficz4o/Dmujn7n0ES
	Sy8ob/knfFbibbfsl/DnSep2fheAmbT+F3Nqcni3Vp5Sxzt2RtFhzPHJiW4bpgmd9oNA
	ZLW4ArJ52twZobHxqoAtszaAeLqErI/A7Rk4qn4C9w2P3vArq4V9OUMBO0KNmJWCvZA3
	FJ4DEK8jn2CE1xzJyWk1vdVVXdmkJ3fZ9AASOqWS1Abd1xe27j00iJSnf4AUGmtBoBwa
	ryig==
X-Gm-Message-State: AJaThX5aG8Pb6P9L5QMOv3t6RA6JVy0jlojT/wlyMp1vmbkPY998sdqL
	DgE/l3T2SHD5eNeRyw0shzO6jQ==
X-Google-Smtp-Source: AGs4zMbV3EQMzQdMScKKVqohK3kOB8FtayQktTWy3NBQ/cFd9vIEJuW9/65yQby3CCkJkBi2Zni3ZQ==
X-Received: by 10.99.44.214 with SMTP id s205mr24335458pgs.80.1511453784294;
	Thu, 23 Nov 2017 08:16:24 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:844b:1cda:e660:cce8?
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	10sm19114325pfi.72.2017.11.23.08.16.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Nov 2017 08:16:23 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Larccb=6j_AgMpMpxtSDkUCSCLzC3HDJ12rqk=9_ybMdQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <40240a76-a59f-b721-2445-e70be9f047ea@gmail.com>
Date: Thu, 23 Nov 2017 08:16:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Larccb=6j_AgMpMpxtSDkUCSCLzC3HDJ12rqk=9_ybMdQ@mail.gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Several Glibc security fixes
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
X-List-Received-Date: Thu, 23 Nov 2017 16:16:23 -0000
Content-Type: multipart/alternative;
	boundary="------------6759BBB521B865B00BF26A77"
Content-Language: en-US

--------------6759BBB521B865B00BF26A77
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/23/2017 04:00 AM, Burton, Ross wrote:
> On 23 November 2017 at 03:52, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     The pending 2.27 update does not need these. Only apply if that
>     update is delayed too long.
>
>
> I don't see a pending 2.27 update, just a 2.26 update (to
> 77f921dac17c5fa99bd9e926d926c327982895f7).=C2=A0 Is there a patch I'm m=
issing?

I was hoping, would have made things easier.. so how do we plan on
disgusting between the two 2.26 versions ?? The CVE checker wont be able
too.

its possible this set of patchs may be different for the pending merge.

- armin
>
> Ross=C2=A0


--------------6759BBB521B865B00BF26A77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/23/2017 04:00 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Larccb=6j_AgMpMpxtSDkUCSCLzC3HDJ12rqk=9_ybMdQ@mail.gmail.com">
      <div dir="ltr">On 23 November 2017 at 03:52, Armin Kuster <span
          dir="ltr">&lt;<a href="mailto:akuster808@gmail.com"
            target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">The
              pending 2.27 update does not need these. Only apply if
              that update is delayed too long.<br>
            </blockquote>
            <div><br>
            </div>
            <div>I don't see a pending 2.27 update, just a 2.26 update
              (to 77f921dac17c5fa99bd9e926d926c327982895f7).  Is there a
              patch I'm missing?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I was hoping, would have made things easier.. so how do we plan on
    disgusting between the two 2.26 versions ?? The CVE checker wont be
    able too.<br>
    <br>
    its possible this set of patchs may be different for the pending
    merge.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CAJTo0Larccb=6j_AgMpMpxtSDkUCSCLzC3HDJ12rqk=9_ybMdQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6759BBB521B865B00BF26A77--
