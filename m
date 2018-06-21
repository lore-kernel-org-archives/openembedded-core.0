Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4787487E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 12:57:29 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id t2-v6so4511244lfd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wgt8r/pI6HaaS3Lfjn4gP5ZkNQmCQAXls4w5bIV0FEo=;
	b=XTS5L2LWw5W0Y2IG4r7fWHjECw/ZUac5LFpINOHTYPHJPc8myjEHcWt0TbdZIww0a8
	O0Hh+9ge1WoJSakeFFn3PHJWhMAbW6KPFkGz4Yw8i76DYZT9Lm5FJ8iZ71eo8yKZxlwV
	8W49gxZt1dqlt+4tr3/KsqkEZjXdtFewcVHOWfwTaxNifOAYWWgl5ezSUiSoWbZe9Z/P
	MlEdk6+dZPM4SoTzIVwYErkOHA1yMdTXgEEN9OUpLmcwmIU6/ALxabVfS13Wax3B11zT
	Y/AEO07JeUyX6kSOi2SR574BEwO9lRi7JH+eBHY9n50UEJggjciTBrKv7cSgF6+TAVgX
	/DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wgt8r/pI6HaaS3Lfjn4gP5ZkNQmCQAXls4w5bIV0FEo=;
	b=LW6fVbsciH2MjvASJORWVAKF9nXxuZsNJsNE3mpVBIHO+O5YfojvpjMESEgVihlEzM
	0+wUUK+yK4ECnOEAe0q5MI2BDslEC+mZ+pqGizvmY117GcryNDqEn7KiC6aanYHeH4sX
	2bvc3yGIB7zoYTSwDbZtl5fol1oH8HwNbd4ZSn9Cl4nr7TmJoIbdHZcIYRprvIm70JyP
	rqM0wlbBGHo2WA9fX+L6IDzIXEHUTxwNjaruKVd7VLDhHn951obGGH1kg0mq5XYEjAcF
	Qvi2nOJF6oq8DpWxROZK+T4VGKmvsLzgvxk9y0oIKLHios3q/yQMBf5vReGiejx4ad4J
	eooA==
X-Gm-Message-State: APt69E2ZleqQhCk9E4aRXHIol+vfLrwAXNhdRnveu95F0dgjfTvVAgjT
	s8JABkUxT2eKgp2VM+QL0eaY3Il1e1aT4v5b2QQ=
X-Google-Smtp-Source: ADUXVKLrOIUjrD6l5kAn1SIHqSMrS0IfekvRzezHyPg0LdPSFwl1i3QZF6BzqoAvDgyndgkHa0OeBKKwuJhITqDoqJ4=
X-Received: by 2002:a19:a78a:: with SMTP id
	q132-v6mr7692386lfe.126.1529585849802; 
	Thu, 21 Jun 2018 05:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 05:57:29
	-0700 (PDT)
In-Reply-To: <0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com>
References: <cover.1528944217.git.dengke.du@windriver.com>
	<0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Jun 2018 08:57:29 -0400
Message-ID: <CADkTA4Ok5WgoOWgBwyNbSaJg_hpN6eKPRV-1FkL9GnMsnOw2wg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 21 Jun 2018 12:57:30 -0000
Content-Type: text/plain; charset="UTF-8"

My general comment still stands from v1, That I don't see a lot of
value in creating a
whole set of custom tests and wrappers just for ptest use.

i.e. ltp already has a lot of these covered. kprobes, as do the
built-in self tests.

I want to be sure that we aren't creating custom wrappers that will
need to be maintained
for a long time.

Comments/documentation in the script don't exist, so it is difficult
to look at this and
understand what it is actually trying to test. A header block and
comments before each
test are required.

On Wed, Jun 13, 2018 at 10:49 PM, Dengke Du <dengke.du@windriver.com> wrote:
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto/run-ptest | 138 ++++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb   |   9 ++
>  2 files changed, 147 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/run-ptest b/meta/recipes-kernel/linux/linux-yocto/run-ptest
> new file mode 100644
> index 0000000..6db4d93
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/run-ptest
> @@ -0,0 +1,138 @@
> +#!/bin/bash
> +depmod
> +touch kernel.log
> +
> +#dma-example bytestream-example inttype-example record-example
> +list1=("dma-example" "bytestream-example" "inttype-example" "record-example")
> +for i in "${list1[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"

All of the modprobes really should be checking for failure, I realize you are
doing some lsmod calls and checking those, but that isn't always the case
in this script.

Cheers,

Bruce

> +  result=""
> +  IFS="-" read -ra array <<< "$i"
> +  len=${#array[@]}
> +  if [ $len -eq 2 ];then
> +    result="${array[0]}_${array[1]}"
> +  elif [ $len -eq 3 ];then
> +    result="${array[0]}_${array[1]}_${array[2]}"
> +  fi
> +  lsmod | grep -q "$result"
> +  if [ $? -eq 0 ];then
> +    dmesg | grep "test passed"
> +    if [ $? -eq 0 ];then
> +      echo "$i: PASS" >> kernel.log
> +    fi
> +  else
> +    echo "$i: FAILED" >> kernel.log
> +  fi
> +  rmmod "$i"
> +done
> +
> +#kobject-example kset-example
> +list2=("kobject-example" "kset-example")
> +for i in "${list2[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  result=""
> +  IFS="-" read -ra array <<< "$i"
> +  len=${#array[@]}
> +  if [ $len -eq 2 ];then
> +    result="${array[0]}_${array[1]}"
> +  elif [ $len -eq 3 ];then
> +    result="${array[0]}_${array[1]}_${array[2]}"
> +  fi
> +  basedir="/sys/kernel/${result}"
> +  echo "$basedir"
> +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
> +    echo "$i: PASS" >> kernel.log
> +  else
> +    echo "$i: FAILED" >> kernel.log
> +  fi
> +  rmmod "$i"
> +done
> +
> +#trace-events-sample
> +list3="trace-events-sample"
> +result=""
> +IFS="-" read -ra array <<< "$list3"
> +len=${#array[@]}
> +if [ $len -eq 2 ];then
> +  result="${array[0]}_${array[1]}"
> +elif [ $len -eq 3 ];then
> +  result="${array[0]}_${array[1]}_${array[2]}"
> +fi
> +modprobe "$list3"
> +lsmod | grep "$result"
> +if [ $? -eq 0 ];then
> +  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
> +    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
> +    sleep 5
> +    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d':' -f2`
> +    if [ "$ret" = " foo_bar" ];then
> +      echo "$list3: PASS"  >> kernel.log
> +    else
> +      echo "$list3: FAILED-" >> kernel.log
> +    fi
> +  else
> +    echo "$list3: FAILED--" >> kernel.log
> +  fi
> +else
> +  echo "$list3: FAILED---" >> kernel.log
> +fi
> +rmmod "$list3"
> +
> +#trace-printk
> +list4="trace-printk"
> +modprobe "$list4"
> +lsmod | grep "trace_printk"
> +if [ $? -eq 0 ];then
> +  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk | head -n1 | cut -d':' -f2`
> +  if [ "$ret" = " trace_printk_irq_work" ];then
> +    echo "$list4: PASS" >> kernel.log
> +    rmmod "$list4"
> +  else
> +    echo "$list4: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list4: FAILED" >> kernel.log
> +fi
> +rmmod "$list4"
> +
> +#kprobe_example
> +list5="kprobe_example"
> +dmesg -c
> +modprobe "$list5"
> +lsmod | grep "$list5"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork"
> +  if [ $? -eq 0 ];then
> +    echo "$list5: PASS" >> kernel.log
> +  else
> +    echo "$list5: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list5: FAILED" >> kernel.log
> +fi
> +rmmod "$list5"
> +
> +#kretprobe_example
> +list6="kretprobe_example"
> +dmesg -c
> +modprobe "$list6"
> +lsmod | grep "$list6"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork returned"
> +  if [ $? -eq 0 ];then
> +    echo "$list6: PASS" >> kernel.log
> +  else
> +    echo "$list6: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list6: FAILED" >> kernel.log
> +fi
> +rmmod "$list6"
> +
> +echo "#####result#####"
> +cat kernel.log
> +rm kernel.log
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> index 0449213..9650ee2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> @@ -45,3 +45,12 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +inherit ptest
> +SRC_URI_append = " file://run-ptest \
> +"
> +do_install_ptest_append() {
> +        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +}
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

