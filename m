Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36157.1793890271584975575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=jF+9kWGD;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=dYA0cWAf;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CB5467A01B1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 09:51:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 05 Nov 2026 09:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793890270;
	 x=1793976670; bh=fg51Fqt04kN4JM7grtBEnO9JOGnGYOA1OeZuy7o87jo=; b=
	jF+9kWGDlHEC3mXuc748MUtEY5S0cSMHOWxuoS0O5hHWXLwG+e4xGt4XmwjPnVr+
	BMsnlYQJBNrgVJh8lVyAH98q+cv5xGm6+j6C5RgfkvkK3imyibDa52liSJizYlaR
	FBt/Zpndvpoi6OFqMFg5GPKrUUbndARhMUQVEQN2zW4dPJLfXKG5VrM7vBW1SrWq
	XnlSjDSCHOmLYDkoKyhPhb+l14jfkjbQv9QKn+WNmkD3OqgzydhdKaks6s+q1+ph
	NuWcbCXTccV1tKUwDcXAYyaBRbWuL5WNqOu5h8EH/FrptIyJcIVWHkxH9hMHadVA
	fXTNkDPsRkwL/VFrGW9qcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793890270; x=
	1793976670; bh=fg51Fqt04kN4JM7grtBEnO9JOGnGYOA1OeZuy7o87jo=; b=d
	YA0cWAfT1HCIggbCG9PmgIdBl+MPhMBfhez2ZBmUgUV4XDnmk/UWrEYgjeaZXa4d
	zIn3G+IrcUTeILzVjlQdMRthxVw7/iuM/maXjbtTWLlhqOoD0JK8y/8SLt0vtSJj
	9JzRzZlpi91rOHX7d6TMhKk7r2cmb33adKuBJUfFXwRLKH+c5ldof3QSaBMrxPg1
	TFBVDVFOgkkrPaW9tjTrIJHfk0Dq8yPqXU0LxS3r93MqS6MiAS2PQTPhW/YsYcoN
	PLExH9p5HPv5dtmS6HUKA5AAMSOAbrfdLVRkYhkb7Q2JxCB7D/8U0eycRhCcaoTS
	668AtKVe4/kwUQ+UQXn4g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793890270; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:kApzsuV1GmALs3FcVeWbbqlb3n4zDMgNDsa8RhgesDy5YLS
	8666wGE/UjY7hPm4Y4q4HfO9109Uir3ks9zEurw9v6jHILSSbB6cLfJVxcrd734O
	+aU2NlEg8USePjY7UoeNkBqBSq12JKVn9joFKpm3oY42qtDe9iSCjLFSNBuKRBci
	fMZjPCdOX8f/PwlRJ4JL+aIW1poA1FmkAjZjQ0GMvE2MBTsxYlsrEjIi13FG7mPz
	JoJfokbyXhDfs5drOmZLnccabi2uzt35uFu38uxBKAHVsnIjnZdqgozaWZZwOM1m
	7y7xv4bl8Au3oqadcZ0AGh3VGJ6fCRwvnngD5lw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:88JJMr8cIF/9GD7JZ2l/zhdd9it8ALvkItnaSsD2Csc=:3HMnND8RIRNeE3ELJTXNrybB7edxrpI6nfLSNl1U5kY=;
X-ME-Sender: <xms:3pfsau-jOsSW-yUw2Qieoy0e0baE7ohKwDoW72rxQvZcuJYDZRntQA>
    <xme:3pfsamJ-ZlBd8b0l-_hFhw1gGOfsguPnUxfuCTzwVhsWOvsVuh9Lpi6XIikEcGtm1
    bSnk9ZUoRZaXxyxWO46EymPw2jl22e_UYUBgvS-5u4D3Hg6I6SXFQ>
X-ME-Received: <xmr:3pfsahbkBQR1Cu296pU979a78x6yPL2-Ep4-R9BfV_tkgqjE6jUE6a5bcOgKCAomNjxTYWwT5hDkLy0l-jLgHaxCKIs2>
X-ME-Proxy-Cause: dmFkZTGDGoDYKcQdbCSsLWJinUclziA/IjkVqeT02YRCatHhq81BhCWEpoz4fKf3XDW3l7
    dHMTJ3qiHeTf/cn69LWvtpe8txpmPidCJuxsZgxRxwLwvNrJ0uZGahKP/dACQp/1BI3DFl
    grU/2r9rWJDsc9N7Fq1HYHOZ3CaGjgnZklDCy1jcI8n4S1tOsHxcHv0EQlSyZaufHaGC/W
    N88u1WqvEb3IdHm7R2YAo3or++C9Q0Wg3KfnE6F0g0j4+4MDVgZ/G6Wy21TSu1n7s8klpf
    qjja9eb8pJkef0/HG6vMI/ddYrEYDQNwWUgX/bUDDVvQCjST1uM2CjDP78vafRgxw75/l6
    moelxZ1wJcmg3OxUFK2REaAKaLLSCGXLEqNL5sPxB3Es0uprtiLusApYVzlDddhaSuyMZd
    +a8e6PaFtOAagjsXO7UTDKh7lOPAtvXOAdVAX3mynFtDPJPJdNNJPOOGUXI9S6yNgUQ4dM
    n4Vz8mFSsqwfQhy3xpOZU92DiPg2Aftro3chcqpblK1B28kQdBw285aquOyP0f5Xg0nlSv
    zLLNomM5RkdWcvaBYDFoY5M3PThP+vcovejYSYnUg8BNNSORvBfRgC2bI9q3ETnsaWmSWV
    50L2m4PZ8Ra8XIcmYwvnyaJ43jwaU1cYC7yjHn/mHbMFfOo273cEcbech76g
X-ME-Proxy: <xmx:3pfsagJlgEIIUnqP92Y50q51KazZo_KrBIqZDM1lmRg2PeazCbbBiw>
    <xmx:3pfsanBJpO9f4fnHvU-nip2A1OcflQeyj9TMMeOgAegq4Np62H22fA>
    <xmx:3pfsatplv4AZS_T54ogCqnbixHPAc9UG6IQhS5YWuRvo-RtFH73TxQ>
    <xmx:3pfsaqhDyyW7wCqTbDhXdHpjzWSZDLqUgTyYEMt_M2kLmUkBmj5GEw>
    <xmx:3pfsapy_nKdqH0BEuvUJDcDA7XpOLdusIaIWTVeG1MgMetBLCqLDeual>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 09:51:09 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 14:51:08 +0000
Message-Id: <DMND10P3QR3O.3C38IOM96LHDE@pbarker.dev>
From: "Paul Barker" <paul@pbarker.dev>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Cc: <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH] glib-2.0: ptest: skip memory-monitor-psi
 /dev/null test
X-Mailer: aerc 0.22.0
References: <20261026121406.30391-1-pratik.farkase@est.tech>
In-Reply-To: <20261026121406.30391-1-pratik.farkase@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249560

On Mon Oct 26, 2026 at 12:14 PM GMT, Pratik Farkase wrote:
> The /memory-monitor-psi-env-set/write-env-null test sets
> MEMORY_PRESSURE_WATCH=3D/dev/null and asserts that no low-memory-warning
> is emitted. That assumption is unsound: GMemoryMonitorPsi polls the
> watch fd for G_IO_IN and /dev/null is always readable, so the
> low-memory callback fires and the assertion (warning_level =3D=3D -1)
> fails. It reproduces under QEMU system emulation on the autobuilders
> (qemuarm64), and the resulting abort leaves the mock PSI FIFO behind,
> cascading into a mkfifo failure in the memory-monitor-psi test.
>
> Add a patch dropping the test (and its now-unused function); the other
> memory-monitor-psi-env-set subtests still run.
>
> [YOCTO #16464]
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  ...ip-memory-monitor-psi-write-env-null.patch | 88 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib.inc           |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/files/skip-memory-monitor-=
psi-write-env-null.patch
>
> diff --git a/meta/recipes-core/glib-2.0/files/skip-memory-monitor-psi-wri=
te-env-null.patch b/meta/recipes-core/glib-2.0/files/skip-memory-monitor-ps=
i-write-env-null.patch
> new file mode 100644
> index 0000000000..aa9ef919df
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/files/skip-memory-monitor-psi-write-env-=
null.patch
> @@ -0,0 +1,88 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Pratik Farkase <pratik.farkase@est.tech>
> +Date: Mon, 26 Oct 2026 11:55:00 +0000
> +Subject: [PATCH] Skip /memory-monitor-psi-env-set/write-env-null test
> +
> +test_write_env_null sets MEMORY_PRESSURE_WATCH=3D/dev/null and asserts
> +that no low-memory-warning signal is emitted (warning_level stays -1).
> +
> +This assumption does not hold. When MEMORY_PRESSURE_WATCH points at an
> +existing path, GMemoryMonitorPsi opens it with O_RDWR | O_NONBLOCK and
> +creates a GSource polling for G_IO_IN. /dev/null is always readable
> +(reads return immediate EOF), so the source is immediately dispatchable,
> +the low-memory callback fires and warning_level becomes 50, making the
> +assertion (warning_level =3D=3D -1) fail:
> +
> +  GLib-GIO:ERROR:.../gio/tests/memory-monitor-psi-env-set.c:300:
> +  test_write_env_null: assertion failed (warning_level =3D=3D -1): (50 =
=3D=3D -1)
> +
> +Whether the spurious event is caught before the monitor is torn down
> +depends on GMainContext iteration timing, so it only reproduces in
> +slower environments such as QEMU system emulation on the Yocto
> +autobuilders (seen on qemuarm64). The test's abort also leaves the mock
> +PSI FIFO $TMPDIR/cgroup behind, which then makes the separate
> +memory-monitor-psi test fail in tests_setup with "mkfifo(): File exists"=
.
> +
> +Drop the test registration and the now-unused test function. The
> +remaining memory-monitor-psi-env-set subtests still run.
> +
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16464
> +
> +Upstream-Status: Inappropriate [upstream ticket: https://gitlab.gnome.or=
g/GNOME/glib/-/work_items/4094]
> +Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> +---
> + gio/tests/memory-monitor-psi-env-set.c | 36 --------------------------
> + 1 file changed, 36 deletions(-)
> +
> +--- a/gio/tests/memory-monitor-psi-env-set.c
> ++++ b/gio/tests/memory-monitor-psi-env-set.c
> +@@ -269,39 +269,6 @@
> +   g_clear_error (&local_error);
> + }
> +=20
> +-static void
> +-test_write_env_null (SetupData *setup, gconstpointer data)
> +-{
> +-  GMemoryMonitorPsi *monitor;
> +-  unsigned long warning_id;
> +-  int warning_level =3D -1;
> +-  GError *local_error =3D NULL;
> +-
> +-  /* The contents is generated by running "dd if=3D/dev/random of=3D/fo=
o/bar bs=3D128 count=3D1" */
> +-  const gchar *env_write =3D "hVh9eV0BZsh/GWEs9V6zKyO3VUe2MnxTxLZbA7BRo=
7GJKHAAayIRsgO8EI4m8iFskhx/O4cAfpyL"
> +-                           "YQ8LFHMG5XBuBmqD9spZghu0eVYF2X8lCCT+iBlEFw5=
dWiSa6XwJN++AmHi1tp4uJj0UBR7CwV5c"
> +-                           "+ms9ZDUqOQrvlFHUSxw=3D";
> +-
> +-  g_setenv ("MEMORY_PRESSURE_WATCH", "/dev/null", TRUE);
> +-  g_setenv ("MEMORY_PRESSURE_WRITE", env_write, TRUE);
> +-
> +-  monitor =3D g_object_new (G_TYPE_MEMORY_MONITOR_PSI,
> +-                          "proc-path", setup->mock_proc_path,
> +-                          NULL);
> +-  warning_id =3D g_signal_connect (monitor, "low-memory-warning",
> +-                                 G_CALLBACK (memory_monitor_psi_signal_=
cb), &warning_level);
> +-  g_initable_init (G_INITABLE (monitor), NULL, &local_error);
> +-  g_assert_no_error (local_error);
> +-
> +-  g_signal_handler_disconnect (monitor, warning_id);
> +-  g_object_unref (monitor);
> +-
> +-  /* warning_level shouldn't be set */
> +-  g_assert_cmpint (warning_level, =3D=3D, -1);
> +-
> +-  g_clear_error (&local_error);
> +-}
> +-

Hi Pratik,

The other patches for glib-2.0 do not remove the actual test function,
just the g_test_add() call below. That is preferred as the diff is
smaller and so there will be less need to rebase as we update to future
releases. Could you send a v2 which just does that?

> + static gpointer
> + test_write_env_unix_domain_socket_thread (gpointer user_data)
> + {
> +@@ -395,9 +362,6 @@
> +   g_test_add ("/memory-monitor-psi-env-set/write-env", SetupData, NULL,
> +               tests_setup, test_write_env, tests_teardown);
> +=20
> +-  g_test_add ("/memory-monitor-psi-env-set/write-env-null", SetupData, =
NULL,
> +-              tests_setup, test_write_env_null, tests_teardown);
> +-
> +   g_test_add ("/memory-monitor-psi-env-set/write-env-unix-domain-socket=
", SetupData, NULL,
> +               tests_unix_domain_setup, test_write_env_unix_domain_socke=
t, tests_unix_domain_teardown);
> +=20

Best regards,

--=20
Paul Barker

