Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 210466D64B;
	Fri, 30 Nov 2018 02:31:35 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id o89so2380371qko.0;
	Thu, 29 Nov 2018 18:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PFhGNXuGfGMrwh+T5cYw4f6FZ9SUQkbLQfrBzsJibGg=;
	b=TBiw6Zgi46q0H51phCXKFXzWRen1CrCac2dcL7a6lNUVUa5N78iVbcRzBhAl1zQWgD
	Zp5HbaS0l6n+lGregJh4lf4wIHRb35kFW/MgWaAUy1cEvWrNKrvKmqohrcI/9XsMpFvL
	bRxBSswF3oKK56/8r0E4sMUQ+8QAvPIDlj4aQRSP1EDUtDGR5yBtIBadrHjP2Hs9JLG/
	N/MP+BBE1b8MK9K3kYLNUZ+pmAiastxNyiuLfHt5US3iqzSrzc8dhYkEoNMYtTjvHL4B
	QkTAYN/BCexLTTubOtYUqVTf6V65QZDVRJDRGEWUY7MHl14djylB9apgtTww5b/Rz6Kp
	wiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PFhGNXuGfGMrwh+T5cYw4f6FZ9SUQkbLQfrBzsJibGg=;
	b=blacD2n14GuwCeDr68U+Q7kfoEVTMEIYLP9Deu4kJ/azJvyulybcvgSXyIsEbY/EM2
	5BpbPSOVEIIiC1ZvyxrtmhzALeH95YOiX0UzFm5p/nnTaJJIvmtqoHDOjjJ21mfv90+V
	K/6DzVo8wvPn+zvK7Ku85fKflo3FpOJ7ydSjmVsrChMATJGmsadHKhnKDW+fsFTQc25G
	GrGIWNf2yse7AAOxNpSZEAwHuSVLJpmGBvd/brHJZwePR8HGwBuANAytJVMyZekNImiC
	cW29qojIR+CzWM0gNqq/cuTYBmqlPr8PINiQQCeX+6oaEEHA8+19ReQ2s5vT0fOcLQ1X
	XcbA==
X-Gm-Message-State: AA+aEWbuv6H6LX0aErKaoqAH09DypGpqvlLWHToVT8po/mczOzvPdaZk
	QgOQWsFcFcDQVbiBgyd+nq4MDj8m3Pm8nXNytzGiAwhj
X-Google-Smtp-Source: AFSGD/XsRpqU8jWuAIkFjlO5O1nhNrmvDXtax6r4fIKv8AL+ancjsflnnDc8Pq0dBMvWJzfiAuTfQ3MsmrkdbCw+lcQ=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr3804725qkm.102.1543545095798; 
	Thu, 29 Nov 2018 18:31:35 -0800 (PST)
MIME-Version: 1.0
References: <2403371.OeEdUFaxhe@localhost.localdomain>
In-Reply-To: <2403371.OeEdUFaxhe@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Nov 2018 18:31:09 -0800
Message-ID: <CAMKF1srJiBZnB42fhoYOvutDe_Pv0sBRq79p=69UWfgt4QRckg@mail.gmail.com>
To: "Eggleton, Paul" <paul.eggleton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Github pull requests
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
X-List-Received-Date: Fri, 30 Nov 2018 02:31:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 29, 2018 at 5:26 PM Paul Eggleton <paul.eggleton@intel.com> wrote:
>
> Hi folks
>
> Someone pointed out that there are quite a few pull requests on github under
> https://github.com/openembedded/. I know we don't accept these, but it seems
> to me we ought to clean up the ones that are there in order to avoid people
> thinking that they might be (and probably comment on the ones where we haven't
> done so or the submitter hasn't sent them to the mailing list already). I'll
> volunteer to clean them up, but I don't currently have access - can someone
> grant that to me?

I think that will be good. I have taken care of meta-oe ones but I can not
close them

>
> Thanks,
> Paul
>
> --
> Paul Eggleton
> Intel Open Source Technology Centre
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

