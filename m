Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B604C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 07:48:41 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.7598.1741247312734369854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 23:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S5XECqXt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1BF442CE;
	Thu,  6 Mar 2025 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741247311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/YcmwkFoQwQ2QP/qm8oZB4baHFVV6qKyYLhBB+S4xU=;
	b=S5XECqXt1Ym+leTTtqhzFVH/6DTtFeW5It2tRKkTmm6ylMTIJ4CgD86HHcK72ng5U/DMPD
	HKkeBxR4k+f5/gziXEKu7/DfhAcCQ6GgOEXwKnzCq+MKH8JMztUZXvRrApcwrxRGwXAKxJ
	O5uTolbhPNvWoSYD4B0iiCtThxJ3tEJwjDFrgYxAYZYy1r804pb/SSUE67FhyKamglCup2
	PWK7r6AJGbZd1s68JiNdWcZ+I/4vnkRQKKKClga7J5J8Dw0tR7vab2sFmn33G/tLzx8Djw
	daU/wtZW+Ru228hM9odBfmbasaOTAwq7PI1AHkYSle43WS9ROXrprU6o7mpJRw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 08:48:27 +0100
Message-Id: <D890NM3QQGE0.3LTX3270SWGFX@bootlin.com>
Subject: Re: [OE-core][PATCH v2] babeltrace2: upgrade 2.0.6 -> 2.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bin.lan.cn@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250305104846.318301-1-bin.lan.cn@windriver.com>
In-Reply-To: <20250305104846.318301-1-bin.lan.cn@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejffdttddvgfeuveehvdevudefvdelueegveekffeijeevudfgjeejheeifeduhfenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsrggsvghlthhrrggtvgdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghinhdrlhgrnhdrt
 ghnseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 07:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212374

On Wed Mar 5, 2025 at 11:48 AM CET, Bin Lan via lists.openembedded.org wrot=
e:
> From: Bin Lan <bin.lan.cn@windriver.com>
>
> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
> for tests/lib/test_plugin is removed.
>
> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.=
0 PSF-2.0
>
> Changelog:
> Babeltrace 2.1, MIP 1 is available and adds many functions
> to support CTF 2 features.
> The Python bindings wrap all the library changes in the same
> systematic way as in Babeltrace 2.0. Add type hints to the
> public API to assist with static analysis of your applications.
>
> Details about the 2.1.0 release:
> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.=
html
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---

Hi,

Thanks for your patch!

It looks like this is triggering some ptest failures, as can be seen on
the autobuilder:

Failed ptests:
{'babeltrace2': ['cli/convert/test-convert-args.sh_71_-_bad_--component_for=
mat',
                 'cli/convert/test-convert-args.sh_74_-_bad_--component_for=
mat',
                 'cli/convert/test-convert-args.sh_77_-_bad_--component_for=
mat',
                 'cli/convert/test-convert-args.sh_80_-_bad_--component_for=
mat',
                 'cli/convert/test-convert-args.sh_83_-_duplicate_component=
_name:_expected_error_message',
                 'cli/convert/test-convert-args.sh_86_-_unknown_option:_exp=
ected_error_message',
                 'cli/convert/test-convert-args.sh_89_-_--params_without_cu=
rrent_component:_expected_error_message',
                 'cli/convert/test-convert-args.sh_92_-_duplicate_--begin:_=
expected_error_message',
                 'cli/convert/test-convert-args.sh_95_-_duplicate_--end:_ex=
pected_error_message',
                 'cli/convert/test-convert-args.sh_98_-_--begin_and_--timer=
ange:_expected_error_message',
                 'cli/convert/test-convert-args.sh_101_-_--end_and_--timera=
nge:_expected_error_message',
                 'cli/convert/test-convert-args.sh_104_-_bad_--timerange_fo=
rmat',
                 'cli/convert/test-convert-args.sh_107_-_bad_--timerange_fo=
rmat',
                 'cli/convert/test-convert-args.sh_110_-_bad_--timerange_fo=
rmat',
                 'cli/convert/test-convert-args.sh_113_-_bad_--fields_forma=
t:_expected_error_message',
                 'cli/convert/test-convert-args.sh_116_-_bad_--names_format=
:_expected_error_message',
                 'cli/convert/test-convert-args.sh_119_-_unknown_-i:_expect=
ed_error_message',
                 'cli/convert/test-convert-args.sh_122_-_duplicate_-i:_expe=
cted_error_message',
                 'cli/convert/test-convert-args.sh_125_-_unknown_-o:_expect=
ed_error_message',
                 'cli/convert/test-convert-args.sh_128_-_duplicate_-o:_expe=
cted_error_message',
                 'cli/convert/test-convert-args.sh_131_-_--run-args_and_--r=
un-args-0:_expected_error_message',
                 'cli/convert/test-convert-args.sh_134_-_-o_ctf-metadata_wi=
thout_path:_expected_error_message',
                 'cli/convert/test-convert-args.sh_137_-_-i_lttng-live_and_=
implicit_source.ctf.fs:_expected_error_message',
                 'cli/convert/test-convert-args.sh_140_-_implicit_source.ct=
f.fs_without_path:_expected_error_message',
                 'cli/convert/test-convert-args.sh_143_-_implicit_source.ct=
f.lttng-live_without_URL:_expected_error_message',
                 'cli/convert/test-convert-args.sh_146_-_no_source:_expecte=
d_error_message',
                 'cli/convert/test-convert-args.sh_149_-_-o_ctf_without_--o=
utput:_expected_error_message',
                 'cli/convert/test-convert-args.sh_152_-_-o_ctf_+_--output_=
with_implicit_sink.text.pretty:_expected_error_message',
                 'cli/convert/test-convert-args.sh_155_-_--stream-intersect=
ion:_expected_error_message',
                 'cli/convert/test-convert-args.sh_158_-_two_sinks_with_-o_=
dummy_+_--clock-seconds:_expected_error_message',
                 'cli/convert/test-convert-args.sh_161_-_path_non-option_ar=
g_+_user_sink_+_-o_text:_expected_error_message',
                 'cli/test-help.sh_2_-_help_ctf_plugin_expected_output',
                 'cli/test-help.sh_5_-_help_src.ctf.fs_component_class_expe=
cted_output',
                 'cli/test-help.sh_8_-_help_without_parameter_produces_expe=
cted_error',
                 'cli/test-help.sh_11_-_help_with_too_many_parameters_produ=
ces_expected_error',
                 'cli/test-help.sh_14_-_help_with_unknown_plugin_name_produ=
ces_expected_error',
                 'cli/test-help.sh_17_-_help_with_unknown_component_class_n=
ame_produces_expected_error',
                 'cli/test-help.sh_18_-_help_with_unknown_component_class_n=
ame_prints_plugin_help',
                 'cli/test-help.sh_20_-_help_with_unknown_component_class_p=
lugin_produces_expected_error',
                 'cli/test-intersection.sh_16_-_stderr_contains_expected_er=
ror_message',
                 'cli/test-intersection.sh_20_-_stderr_contains_expected_er=
ror_message',
                 'cli/test-output-ctf-metadata.sh_2_-_Run_babeltrace_-o_ctf=
-metadata_with_a_valid_trace_directory,_correct_output',
                 'cli/test-packet-seq-num.sh_6_-_Lost_events_string_matches=
_2',
                 'cli/test-packet-seq-num.sh_8_-_Lost_events_string_matches=
_2',
                 'cli/test-packet-seq-num.sh_10_-_Lost_events_string_matche=
s_2,3,1',
                 'plugins/src.ctf.fs/fail/test-fail.sh_3_-_Trace_invalid-pa=
cket-size/trace:_method_autodisc:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_4_-_Trace_invalid-pa=
cket-size/trace:_method_autodisc:_babeltrace_produces_the_expected_error_me=
ssage',
                 'plugins/src.ctf.fs/fail/test-fail.sh_7_-_Trace_invalid-pa=
cket-size/trace:_method_component:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_8_-_Trace_invalid-pa=
cket-size/trace:_method_component:_babeltrace_produces_the_expected_error_m=
essage',
                 'plugins/src.ctf.fs/fail/test-fail.sh_11_-_Trace_valid-eve=
nts-then-invalid-events/trace:_method_autodisc:_babeltrace_produces_an_erro=
r_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_12_-_Trace_valid-eve=
nts-then-invalid-events/trace:_method_autodisc:_babeltrace_produces_the_exp=
ected_error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_15_-_Trace_valid-eve=
nts-then-invalid-events/trace:_method_component:_babeltrace_produces_an_err=
or_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_16_-_Trace_valid-eve=
nts-then-invalid-events/trace:_method_component:_babeltrace_produces_the_ex=
pected_error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_19_-_Trace_metadata-=
syntax-error:_method_autodisc:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_20_-_Trace_metadata-=
syntax-error:_method_autodisc:_babeltrace_produces_the_expected_error_messa=
ge',
                 'plugins/src.ctf.fs/fail/test-fail.sh_23_-_Trace_metadata-=
syntax-error:_method_component:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_24_-_Trace_metadata-=
syntax-error:_method_component:_babeltrace_produces_the_expected_error_mess=
age',
                 'plugins/src.ctf.fs/fail/test-fail.sh_27_-_Trace_invalid-s=
equence-length-field-class:_method_autodisc:_babeltrace_produces_an_error_s=
tack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_28_-_Trace_invalid-s=
equence-length-field-class:_method_autodisc:_babeltrace_produces_the_expect=
ed_error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_31_-_Trace_invalid-s=
equence-length-field-class:_method_component:_babeltrace_produces_an_error_=
stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_32_-_Trace_invalid-s=
equence-length-field-class:_method_component:_babeltrace_produces_the_expec=
ted_error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_35_-_Trace_invalid-v=
ariant-selector-field-class:_method_autodisc:_babeltrace_produces_an_error_=
stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_36_-_Trace_invalid-v=
ariant-selector-field-class:_method_autodisc:_babeltrace_produces_the_expec=
ted_error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_39_-_Trace_invalid-v=
ariant-selector-field-class:_method_component:_babeltrace_produces_an_error=
_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_40_-_Trace_invalid-v=
ariant-selector-field-class:_method_component:_babeltrace_produces_the_expe=
cted_error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_43_-_Trace_incomplet=
e-packet-header:_method_autodisc:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_44_-_Trace_incomplet=
e-packet-header:_method_autodisc:_babeltrace_produces_the_expected_error_me=
ssage',
                 'plugins/src.ctf.fs/fail/test-fail.sh_47_-_Trace_incomplet=
e-packet-header:_method_component:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_48_-_Trace_incomplet=
e-packet-header:_method_component:_babeltrace_produces_the_expected_error_m=
essage',
                 'plugins/src.ctf.fs/fail/test-fail.sh_51_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_an_error_stack=
',
                 'plugins/src.ctf.fs/fail/test-fail.sh_52_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_the_expected_e=
rror_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_55_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_component:_babeltrace_produces_an_error_stac=
k',
                 'plugins/src.ctf.fs/fail/test-fail.sh_56_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_component:_babeltrace_produces_the_expected_=
error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_59_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_an_error_stack=
',
                 'plugins/src.ctf.fs/fail/test-fail.sh_60_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_autodisc:_babeltrace_produces_the_expected_e=
rror_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_63_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_component:_babeltrace_produces_an_error_stac=
k',
                 'plugins/src.ctf.fs/fail/test-fail.sh_64_-_Trace_meta-no-t=
race-cls-no-stream-cls:_method_component:_babeltrace_produces_the_expected_=
error_message',
                 'plugins/src.ctf.fs/fail/test-fail.sh_67_-_Trace_empty-eve=
nt-record:_method_autodisc:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_68_-_Trace_empty-eve=
nt-record:_method_autodisc:_babeltrace_produces_the_expected_error_message'=
,
                 'plugins/src.ctf.fs/fail/test-fail.sh_71_-_Trace_empty-eve=
nt-record:_method_component:_babeltrace_produces_an_error_stack',
                 'plugins/src.ctf.fs/fail/test-fail.sh_72_-_Trace_empty-eve=
nt-record:_method_component:_babeltrace_produces_the_expected_error_message=
',
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_35_-_CTF_1:_Tr=
ace_'lttng-event-after-packet'_gives_the_expected_stdout",
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_37_-_CTF_1:_Tr=
ace_'lttng-event-after-packet'_gives_the_expected_stdout",
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_39_-_CTF_2:_Tr=
ace_'lttng-event-after-packet'_gives_the_expected_stdout",
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_41_-_CTF_1:_Tr=
ace_'lttng-crash'_gives_the_expected_stdout",
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_43_-_CTF_1:_Tr=
ace_'lttng-crash'_gives_the_expected_stdout",
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_45_-_CTF_2:_Tr=
ace_'lttng-crash'_gives_the_expected_stdout",
                 "plugins/src.ctf.fs/succeed/test-succeed.sh_47_-_Trace_'cl=
ock-offset-goes-back-in-time'_gives_the_expected_output",
                 'plugins/src.ctf.fs/test-deterministic-ordering.sh_2_-_ab:=
_error_stack_is_produced',
                 'plugins/src.ctf.fs/test-deterministic-ordering.sh_3_-_ab:=
_expected_error_message_is_present',
                 'plugins/src.ctf.fs/test-deterministic-ordering.sh_5_-_ba:=
_error_stack_is_produced',
                 'plugins/src.ctf.fs/test-deterministic-ordering.sh_6_-_ba:=
_expected_error_message_is_present',
                 'plugins/src.ctf.lttng-live/test-live.sh_1_-_CLI_prints_th=
e_expected_session_list_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_3_-_CLI_prints_th=
e_expected_session_list',
                 'plugins/src.ctf.lttng-live/test-live.sh_5_-_CLI_attach_an=
d_fetch_from_single-domains_session_-_no_discarded_events_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_7_-_CLI_attach_an=
d_fetch_from_single-domains_session_-_no_discarded_events',
                 'plugins/src.ctf.lttng-live/test-live.sh_9_-_CLI_attach_an=
d_fetch_from_multi-domains_session_-_discarded_events_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_11_-_CLI_attach_a=
nd_fetch_from_multi-domains_session_-_discarded_events',
                 'plugins/src.ctf.lttng-live/test-live.sh_13_-_CLI_many_req=
uests_per_packet_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_15_-_CLI_src.ctf.=
fs_vs_src.ctf.lttng-live_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_17_-_CLI_src.ctf.=
fs_vs_src.ctf.lttng-live_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_19_-_CLI_attach_a=
nd_fetch_from_single-domains_session_-_inactivity_discarded_packet_-_stdout=
',
                 'plugins/src.ctf.lttng-live/test-live.sh_21_-_CLI_attach_a=
nd_fetch_from_single-domain_session_-_Receive_metadata_in_two_sections_sepa=
rated_by_a_empty_section_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_23_-_split_metada=
ta_requiring_additional_stored_values_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_25_-_new_stream_a=
nnounced_while_an_existing_stream_is_inactive_-_stdout',
                 'plugins/src.ctf.lttng-live/test-live.sh_28_-_invalid_meta=
data_sent_by_the_relay_-_stderr',
                 'cli/convert/test-convert-args.sh',
                 'cli/test-help.sh',
                 'cli/test-intersection.sh',
                 'cli/test-output-ctf-metadata.sh',
                 'cli/test-packet-seq-num.sh',
                 'plugins/src.ctf.fs/fail/test-fail.sh',
                 'plugins/src.ctf.fs/succeed/test-succeed.sh',
                 'plugins/src.ctf.fs/test-deterministic-ordering.sh',
                 'plugins/src.ctf.lttng-live/test-live.sh']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1058/ste=
ps/12/logs/stdio

Extra log data can be found in: https://valkyrie.yocto.io/pub/non-release/2=
0250305-106/testresults/qemux86-64-ptest/core-image-ptest-babeltrace2/

Can you have a look at this failure please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


