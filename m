Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4DC6B5B1
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:11:46 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ht10so152586vcb.38
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 04:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bsF7bJhfJzD04GgKhXIjoKVcdxF7G1+5kz5gLIsqFZI=;
	b=Qe2JVWP3NSZFfo5RQZITT055j8t7f1DyFgLSUxle289Y+VYIbKVXMv7q0ZhSpWQyhb
	NArgomrvTsHOlG57qbe4YLKTm3DaJmfzOiEAXdpni4d9uMV8+BM4TJl5ZD8TmPKdUS9N
	qwgCajb0H5q1rNkbuaehmr+Qg0D8hvbjl/T96MC+jFg8rmHQAg+6EmPStEMEiyBfTrvW
	vv7zfrZDsTlZUqoQMPlHjxxFHjr7Po5AAGRl+n6rmGvb9vri1BO8Y9mOB+yPxGy9N5VW
	2aZcmCHmK2akDz3djNctAxO+ZnU6Opp9SuHcXSjEv6XL6bkP0oCS+EPt+mjqReL1suYS
	XzOg==
X-Gm-Message-State: ALoCoQmuHJYnrAm2xSZPJzsK9LkR1/5RzjKM2RGHYydoqYr2lWooOhzI9Yf8oTyCOcymleYT/IIk
X-Received: by 10.220.181.136 with SMTP id by8mr744583vcb.11.1376997106573;
	Tue, 20 Aug 2013 04:11:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 04:11:26 -0700 (PDT)
In-Reply-To: <b8e848c82d5c361278328b0569509f6cc4f58d36.1376939912.git.nitin.a.kamble@intel.com>
References: <cover.1376939912.git.nitin.a.kamble@intel.com>
	<b8e848c82d5c361278328b0569509f6cc4f58d36.1376939912.git.nitin.a.kamble@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 12:11:26 +0100
Message-ID: <CAJTo0LayXbOWSnT=F5=ud2Vy__b0ipc9Xx6ujKkups2zWSLM7A@mail.gmail.com>
To: nitin.a.kamble@intel.com
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: a new check for required distro features
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
X-List-Received-Date: Tue, 20 Aug 2013 11:11:46 -0000
Content-Type: text/plain; charset=UTF-8

On 19 August 2013 20:22,  <nitin.a.kamble@intel.com> wrote:
> Now these BSPs can specify in their BSP config, what distro features
> are required, and if these are not enabled then appropriate build
> error is thrown to help fix the issue.

Are there any situations where these distro feature dependencies can't
be expressed more precisely in a package recipe, and then something
like Otavio's approach of throwing a SkipPackage used?

Ross

