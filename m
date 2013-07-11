Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id C52F56AECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 09:57:59 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so5324446eek.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 02:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=Hk2MhkzuAb/olYZCmwrzA7niX2oHDo/HTdtN8X9uG/s=;
	b=biVpE12/YwcZcc11Hpj1uwBY//Ess0rOWv9pgM9i/RSKGaqi9YrVRB4eb+BvErfkG4
	SHshxOls1OeUmbsSg3R463QSlQw7/JT/G1rmRlMra3BweLn3PM8kpsmQXZRaAaZe8iC1
	IJkJEyOcsbJD3ANf3F7pcKN3mkAt6bzvakmeVFIjzsD66A+g9ZB8jIcyuEWPOf1HFGEm
	AqSrhPan7jn7LR/8hWOTX4ndlidD95J3aLTNLGn6aOB/INPP9BXwD8oY8+ggERGwnUam
	IPwVnSZ/JKl0hrEfHnL8Y6w5IEPJh2QuQKou0Rp+9YOzymcpCsK+fv6aeJz6WLBqM8V8
	o9cA==
MIME-Version: 1.0
X-Received: by 10.15.102.68 with SMTP id bq44mr41030734eeb.89.1373536679643;
	Thu, 11 Jul 2013 02:57:59 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Thu, 11 Jul 2013 02:57:59 -0700 (PDT)
In-Reply-To: <985E5BBDA0968D48ABDF343456A521B3022C98DE@IRSMSX105.ger.corp.intel.com>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<a9d90af766913d932c03bc57e395bab720cfbe3c.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<bf65f77f194b7e5a9047a2196e87a2d59f8e0e6b.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<CALmOhgnPu5RGZ4iC+C3XjdbD6rT1OKwfy0Q_ATPLqH2o0uVZhg@mail.gmail.com>
	<985E5BBDA0968D48ABDF343456A521B3022C98DE@IRSMSX105.ger.corp.intel.com>
Date: Thu, 11 Jul 2013 10:57:59 +0100
Message-ID: <CALmOhg=HxXkk+22wRYr_+PPWs0RyyUP2RbNdjo5bBSm_YaK3Yw@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
X-Gm-Message-State: ALoCoQm/50/zjt0FPO0CpK+L4hqlDlvJVN/vGB57EOYJZ/YOP8zUzF2aPruNX3eWG1PsuZJVpZ17
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] docbook-sgml-dtd-3.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Thu, 11 Jul 2013 09:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 July 2013 10:55, Ciobanu, Emilia Maria Silvia
<emilia.maria.silvia.ciobanu@intel.com> wrote:
> I think this is a misunderstanding. We are currently using the autoincrementation
> mechanism for the PR of the packages and not for the PV.  In this case the PV variable
> was missing from the recipe.


Whoops! Yes I see. Sorry about that :-)

