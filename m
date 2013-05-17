Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UdDN0-0004MX-6i
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 07:38:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4H5K7CP026240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 22:20:07 -0700 (PDT)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 16 May 2013 22:20:04 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 May 2013 13:22:01 +0800
Message-ID: <cover.1368761545.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH v2 0/1] perl-tests: convert to ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 05:38:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Some changes:
1. add a ptest-format.patch
2. install all .t tests from the lib dir. They are needed tests.

The tests now complete correctly. And the result is:

    Failed 168 tests out of 1929, 91.29% okay.

The whole report is attached at the end.

jesse

The following changes since commit a5f4e5fd991a15d2d9bf48768d214bdc5a68e33c=
:

  qemuimage-testlib: change default directory for target tests (2013-05-16 =
00:23:37 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/perl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dszhang/perl

Jesse Zhang (1):
  perl-tests: convert to ptest

 .../perl/perl-5.14.3/ptest-format.patch            | 69 ++++++++++++++++++=
++++
 meta/recipes-devtools/perl/perl-5.14.3/run-ptest   |  2 +
 meta/recipes-devtools/perl/perl-ptest.inc          | 50 ++++++++++++++++
 meta/recipes-devtools/perl/perl-tests.inc          | 36 -----------
 meta/recipes-devtools/perl/perl_5.14.3.bb          |  2 +-
 5 files changed, 122 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/ptest-format.pat=
ch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/run-ptest
 create mode 100644 meta/recipes-devtools/perl/perl-ptest.inc
 delete mode 100644 meta/recipes-devtools/perl/perl-tests.inc

--=20
1.7.11.7


PASS: t/base/cond.t
PASS: t/base/if.t
PASS: t/base/lex.t
PASS: t/base/num.t
PASS: t/base/pat.t
PASS: t/base/rs.t
PASS: t/base/term.t
PASS: t/base/while.t
PASS: t/comp/bproto.t
PASS: t/comp/cmdopt.t
PASS: t/comp/colon.t
PASS: t/comp/decl.t
PASS: t/comp/final_line_num.t
PASS: t/comp/fold.t
PASS: t/comp/form_scope.t
PASS: t/comp/hints.t
PASS: t/comp/line_debug.t
PASS: t/comp/multiline.t
PASS: t/comp/opsubs.t
PASS: t/comp/our.t
PASS: t/comp/package.t
PASS: t/comp/package_block.t
PASS: t/comp/parser.t
PASS: t/comp/proto.t
PASS: t/comp/redef.t
PASS: t/comp/require.t
PASS: t/comp/retainedlines.t
PASS: t/comp/term.t
PASS: t/comp/uproto.t
PASS: t/comp/use.t
PASS: t/comp/utf.t
PASS: t/run/cloexec.t
PASS: t/run/exit.t
PASS: t/run/fresh_perl.t
SKIP: t/run/locale.t
PASS: t/run/noswitch.t
PASS: t/run/runenv.t
PASS: t/run/script.t
PASS: t/run/switch0.t
PASS: t/run/switchC.t
PASS: t/run/switchF.t
PASS: t/run/switchF1.t
PASS: t/run/switchI.t
PASS: t/run/switcha.t
PASS: t/run/switchd-78586.t
PASS: t/run/switchd.t
# Failed at run/switches.t line 272
#      got '
# This is perl 5, version 14, subversion 3 (v5.14.3) built for i586-linux
#=20
# Copyright 1987-2012, Larry Wall
#=20
# Perl may be copied only under the terms of either the Artistic License or=
 the
# GNU General Public License, which may be found in the Perl 5 source kit.
#=20
# Complete documentation for Perl, including FAQ lists, should be found on
# this system using "man perl" or "perldoc perl".  If you have access to th=
e
# Internet, point your browser at http://www.perl.org/, the Perl Home Page.
#=20
# '
# expected /(?^s:This is perl 5, version 14, subversion 2 \(v5\.14\.3(?:[-*=
\w]+| \([^)]+\))?\) built for i586\-linux.+Copyright.+Larry Wall.+Artistic =
License.+GNU General Public License)/
FAIL: t/run/switches.t
FAILED at test 29
PASS: t/run/switchn.t
PASS: t/run/switchp.t
PASS: t/run/switcht.t
PASS: t/run/switchx.t
PASS: t/cmd/elsif.t
PASS: t/cmd/for.t
PASS: t/cmd/mod.t
PASS: t/cmd/subval.t
PASS: t/cmd/switch.t
PASS: t/cmd/while.t
PASS: t/io/argv.t
PASS: t/io/binmode.t
PASS: t/io/bom.t
PASS: t/io/crlf.t
PASS: t/io/crlf_through.t
PASS: t/io/data.t
PASS: t/io/defout.t
PASS: t/io/dup.t
SKIP: t/io/eintr.t
PASS: t/io/errno.t
PASS: t/io/errnosig.t
PASS: t/io/fflush.t
PASS: t/io/fs.t
PASS: t/io/inplace.t
PASS: t/io/iofile.t
PASS: t/io/iprefix.t
PASS: t/io/layers.t
PASS: t/io/nargv.t
PASS: t/io/open.t
PASS: t/io/openpid.t
PASS: t/io/perlio.t
PASS: t/io/perlio_fail.t
PASS: t/io/perlio_leaks.t
PASS: t/io/perlio_open.t
PASS: t/io/pipe.t
PASS: t/io/print.t
PASS: t/io/pvbm.t
PASS: t/io/read.t
PASS: t/io/say.t
PASS: t/io/tell.t
PASS: t/io/through.t
PASS: t/io/utf8.t
PASS: t/re/charset.t
PASS: t/re/fold_grind.t
PASS: t/re/no_utf8_pm.t
PASS: t/re/overload.t
PASS: t/re/pat.t
PASS: t/re/pat_advanced.t
PASS: t/re/pat_advanced_thr.t
PASS: t/re/pat_psycho.t
PASS: t/re/pat_psycho_thr.t
PASS: t/re/pat_re_eval.t
PASS: t/re/pat_re_eval_thr.t
PASS: t/re/pat_rt_report.t
PASS: t/re/pat_rt_report_thr.t
PASS: t/re/pat_special_cc.t
PASS: t/re/pat_special_cc_thr.t
PASS: t/re/pat_thr.t
PASS: t/re/qr-72922.t
PASS: t/re/qr.t
PASS: t/re/qr_gc.t
PASS: t/re/qrstack.t
PASS: t/re/reg_60508.t
PASS: t/re/reg_email.t
PASS: t/re/reg_email_thr.t
PASS: t/re/reg_eval.t
PASS: t/re/reg_eval_scope.t
PASS: t/re/reg_fold.t
PASS: t/re/reg_mesg.t
PASS: t/re/reg_namedcapture.t
PASS: t/re/reg_nc_tie.t
PASS: t/re/reg_pmod.t
SKIP: t/re/reg_posixcc.t
PASS: t/re/regexp.t
PASS: t/re/regexp_noamp.t
PASS: t/re/regexp_notrie.t
PASS: t/re/regexp_qr.t
PASS: t/re/regexp_qr_embed.t
PASS: t/re/regexp_qr_embed_thr.t
PASS: t/re/regexp_trielist.t
PASS: t/re/regexp_unicode_prop.t
PASS: t/re/regexp_unicode_prop_thr.t
PASS: t/re/rxcode.t
PASS: t/re/subst.t
PASS: t/re/substT.t
PASS: t/re/subst_amp.t
PASS: t/re/subst_wamp.t
PASS: t/re/substr.t
PASS: t/re/substr_thr.t
PASS: t/re/uniprops.t
SKIP: t/op/64bitint.t
PASS: t/op/alarm.t
PASS: t/op/anonsub.t
PASS: t/op/append.t
PASS: t/op/args.t
PASS: t/op/arith.t
PASS: t/op/array.t
PASS: t/op/array_base.t
PASS: t/op/assignwarn.t
PASS: t/op/attrhand.t
PASS: t/op/attrs.t
PASS: t/op/auto.t
PASS: t/op/avhv.t
PASS: t/op/bless.t
PASS: t/op/blocks.t
PASS: t/op/bop.t
PASS: t/op/caller.t
PASS: t/op/chars.t
PASS: t/op/chdir.t
PASS: t/op/chop.t
PASS: t/op/chr.t
PASS: t/op/closure.t
PASS: t/op/cmp.t
PASS: t/op/concat.t
PASS: t/op/concat2.t
PASS: t/op/cond.t
PASS: t/op/context.t
PASS: t/op/cproto.t
PASS: t/op/crypt.t
PASS: t/op/dbm.t
PASS: t/op/defins.t
PASS: t/op/delete.t
PASS: t/op/die.t
PASS: t/op/die_except.t
PASS: t/op/die_exit.t
PASS: t/op/die_keeperr.t
PASS: t/op/die_unwind.t
PASS: t/op/do.t
PASS: t/op/dor.t
PASS: t/op/each.t
PASS: t/op/each_array.t
PASS: t/op/eval.t
PASS: t/op/exec.t
PASS: t/op/exists_sub.t
PASS: t/op/exp.t
PASS: t/op/fh.t
PASS: t/op/filehandle.t
PASS: t/op/filetest.t
PASS: t/op/filetest_stack_ok.t
PASS: t/op/filetest_t.t
PASS: t/op/flip.t
PASS: t/op/fork.t
PASS: t/op/getpid.t
PASS: t/op/getppid.t
PASS: t/op/glob.t
PASS: t/op/gmagic.t
PASS: t/op/goto.t
PASS: t/op/goto_xs.t
PASS: t/op/grent.t
PASS: t/op/grep.t
PASS: t/op/groups.t
PASS: t/op/gv.t
PASS: t/op/hash.t
PASS: t/op/hashassign.t
PASS: t/op/hashwarn.t
PASS: t/op/inc.t
PASS: t/op/inccode-tie.t
PASS: t/op/inccode.t
PASS: t/op/incfilter.t
PASS: t/op/index.t
PASS: t/op/index_thr.t
PASS: t/op/int.t
PASS: t/op/join.t
PASS: t/op/kill0.t
PASS: t/op/lc.t
PASS: t/op/lc_user.t
PASS: t/op/leaky-magic.t
PASS: t/op/length.t
PASS: t/op/lex.t
PASS: t/op/lex_assign.t
SKIP: t/op/lfs.t
PASS: t/op/list.t
PASS: t/op/local.t
PASS: t/op/localref.t
PASS: t/op/loopctl.t
PASS: t/op/lop.t
PASS: t/op/magic-27839.t
PASS: t/op/magic.t
PASS: t/op/magic_phase.t
PASS: t/op/method.t
PASS: t/op/mkdir.t
PASS: t/op/my.t
PASS: t/op/my_stash.t
PASS: t/op/mydef.t
PASS: t/op/negate.t
PASS: t/op/not.t
PASS: t/op/numconvert.t
PASS: t/op/oct.t
PASS: t/op/or.t
PASS: t/op/ord.t
PASS: t/op/overload_integer.t
PASS: t/op/override.t
# Failed at op/pack.t line 441
#      got "0"
# expected "12"
# Failed at op/pack.t line 442
#      got "0"
# expected "34"
# Failed at op/pack.t line 441
#      got "0"
# expected "12"
# Failed at op/pack.t line 442
#      got "0"
# expected "34"
FAIL: t/op/pack.t
FAILED at test 402
PASS: t/op/packagev.t
PASS: t/op/pos.t
PASS: t/op/pow.t
PASS: t/op/print.t
PASS: t/op/protowarn.t
PASS: t/op/push.t
PASS: t/op/pwent.t
PASS: t/op/qq.t
PASS: t/op/qr.t
PASS: t/op/quotemeta.t
PASS: t/op/rand.t
PASS: t/op/range.t
PASS: t/op/read.t
PASS: t/op/readdir.t
PASS: t/op/readline.t
PASS: t/op/recurse.t
PASS: t/op/ref.t
PASS: t/op/repeat.t
PASS: t/op/require_errors.t
PASS: t/op/reset.t
PASS: t/op/reverse.t
PASS: t/op/runlevel.t
PASS: t/op/setpgrpstack.t
PASS: t/op/sigdispatch.t
PASS: t/op/sleep.t
PASS: t/op/smartkve.t
PASS: t/op/smartmatch.t
PASS: t/op/sort.t
PASS: t/op/splice.t
PASS: t/op/split.t
PASS: t/op/split_unicode.t
PASS: t/op/sprintf.t
PASS: t/op/sprintf2.t
PASS: t/op/srand.t
PASS: t/op/sselect.t
PASS: t/op/stash.t
PASS: t/op/stat.t
PASS: t/op/state.t
PASS: t/op/study.t
PASS: t/op/studytied.t
PASS: t/op/sub.t
PASS: t/op/sub_lval.t
PASS: t/op/svleak.t
PASS: t/op/switch.t
PASS: t/op/symbolcache.t
PASS: t/op/sysio.t
PASS: t/op/taint.t
PASS: t/op/threads-dirh.t
# Failed at ./test.pl line 828
#      got undef
# expected "ok"
# PROG:=20
# use threads;
# sub foo { return (sub { }); }
# my $bar =3D threads->create(\&foo)->join();
# threads->create(sub { })->join();
# print "ok";
# STATUS: -1
FAIL: t/op/threads.t
FAILED at test 15
PASS: t/op/tie.t
PASS: t/op/tie_fetch_count.t
PASS: t/op/tiearray.t
PASS: t/op/tiehandle.t
PASS: t/op/time.t
PASS: t/op/time_loop.t
PASS: t/op/tr.t
PASS: t/op/turkish.t
PASS: t/op/undef.t
PASS: t/op/universal.t
PASS: t/op/unshift.t
PASS: t/op/upgrade.t
PASS: t/op/utf8cache.t
PASS: t/op/utf8decode.t
PASS: t/op/utf8magic.t
PASS: t/op/utfhash.t
PASS: t/op/utftaint.t
PASS: t/op/vec.t
PASS: t/op/ver.t
PASS: t/op/wantarray.t
PASS: t/op/warn.t
PASS: t/op/while_readdir.t
PASS: t/op/write.t
PASS: t/op/yadayada.t
PASS: t/uni/cache.t
PASS: t/uni/chomp.t
PASS: t/uni/chr.t
PASS: t/uni/class.t
PASS: t/uni/fold.t
PASS: t/uni/greek.t
PASS: t/uni/latin2.t
PASS: t/uni/lex_utf8.t
PASS: t/uni/lower.t
PASS: t/uni/overload.t
PASS: t/uni/sprintf.t
PASS: t/uni/tie.t
PASS: t/uni/title.t
PASS: t/uni/tr_7jis.t
PASS: t/uni/tr_eucjp.t
PASS: t/uni/tr_sjis.t
PASS: t/uni/tr_utf8.t
PASS: t/uni/upper.t
PASS: t/uni/write.t
PASS: t/mro/basic.t
PASS: t/mro/basic_01_c3.t
PASS: t/mro/basic_01_dfs.t
PASS: t/mro/basic_02_c3.t
PASS: t/mro/basic_02_dfs.t
PASS: t/mro/basic_03_c3.t
PASS: t/mro/basic_03_dfs.t
PASS: t/mro/basic_04_c3.t
PASS: t/mro/basic_04_dfs.t
PASS: t/mro/basic_05_c3.t
PASS: t/mro/basic_05_dfs.t
PASS: t/mro/c3_with_overload.t
PASS: t/mro/complex_c3.t
PASS: t/mro/complex_dfs.t
PASS: t/mro/dbic_c3.t
PASS: t/mro/dbic_dfs.t
PASS: t/mro/inconsistent_c3.t
PASS: t/mro/isa_aliases.t
PASS: t/mro/isa_c3.t
PASS: t/mro/isa_dfs.t
PASS: t/mro/isarev.t
PASS: t/mro/method_caching.t
PASS: t/mro/next_NEXT.t
PASS: t/mro/next_edgecases.t
PASS: t/mro/next_goto.t
PASS: t/mro/next_inanon.t
PASS: t/mro/next_ineval.t
PASS: t/mro/next_method.t
PASS: t/mro/next_skip.t
PASS: t/mro/overload_c3.t
PASS: t/mro/overload_dfs.t
PASS: t/mro/package_aliases.t
PASS: t/mro/pkg_gen.t
PASS: t/mro/recursion_c3.t
PASS: t/mro/recursion_dfs.t
PASS: t/mro/vulcan_c3.t
PASS: t/mro/vulcan_dfs.t
PASS: t/lib/1_compile.t
PASS: t/lib/commonsense.t
PASS: t/lib/croak.t
SKIP: t/lib/cygwin.t
PASS: t/lib/deprecate.t
PASS: t/lib/mypragma.t
PASS: t/lib/no_load.t
PASS: t/lib/overload_fallback.t
PASS: t/lib/proxy_constant_subs.t
PASS: t/lib/universal.t
#   Failed test 'extract() for 'double_dir.zip' reports success (PP: 0 Bin:=
 1)'
#   at t/01_Archive-Extract.t line 456.
FAIL: cpan/Archive-Extract/t/01_Archive-Extract.t
FAILED at test 87
PASS: cpan/Archive-Tar/t/01_use.t
PASS: cpan/Archive-Tar/t/02_methods.t
PASS: cpan/Archive-Tar/t/03_file.t
PASS: cpan/Archive-Tar/t/04_resolved_issues.t
PASS: cpan/Archive-Tar/t/05_iter.t
PASS: cpan/Archive-Tar/t/06_error.t
SKIP: cpan/Archive-Tar/t/90_symlink.t
SKIP: cpan/Archive-Tar/t/99_pod.t
PASS: cpan/autodie/t/00-load.t
PASS: cpan/autodie/t/autodie.t
PASS: cpan/autodie/t/backcompat.t
PASS: cpan/autodie/t/basic_exceptions.t
PASS: cpan/autodie/t/binmode.t
PASS: cpan/autodie/t/blog_hints.t
PASS: cpan/autodie/t/caller.t
PASS: cpan/autodie/t/context_lexical.t
PASS: cpan/autodie/t/context.t
PASS: cpan/autodie/t/crickey.t
PASS: cpan/autodie/t/dbmopen.t
PASS: cpan/autodie/t/eval_error.t
PASS: cpan/autodie/t/exception_class.t
PASS: cpan/autodie/t/exceptions.t
PASS: cpan/autodie/t/exec.t
PASS: cpan/autodie/t/Fatal.t
PASS: cpan/autodie/t/filehandles.t
PASS: cpan/autodie/t/fileno.t
PASS: cpan/autodie/t/flock.t
PASS: cpan/autodie/t/format-clobber.t
PASS: cpan/autodie/t/hints_insist.t
PASS: cpan/autodie/t/hints_pod_examples.t
PASS: cpan/autodie/t/hints_provider_does.t
PASS: cpan/autodie/t/hints_provider_easy_does_it.t
PASS: cpan/autodie/t/hints_provider_isa.t
PASS: cpan/autodie/t/hints.t
PASS: cpan/autodie/t/internal-backcompat.t
PASS: cpan/autodie/t/internal.t
PASS: cpan/autodie/t/lethal.t
PASS: cpan/autodie/t/mkdir.t
PASS: cpan/autodie/t/open.t
PASS: cpan/autodie/t/recv.t
PASS: cpan/autodie/t/repeat.t
PASS: cpan/autodie/t/scope_leak.t
PASS: cpan/autodie/t/string-eval-basic.t
PASS: cpan/autodie/t/string-eval-leak.t
PASS: cpan/autodie/t/sysopen.t
PASS: cpan/autodie/t/truncate.t
PASS: cpan/autodie/t/unlink.t
PASS: cpan/autodie/t/user-context.t
PASS: cpan/autodie/t/usersub.t
PASS: cpan/autodie/t/version.t
PASS: cpan/autodie/t/version_tag.t
PASS: cpan/AutoLoader/t/01AutoLoader.t
PASS: cpan/AutoLoader/t/02AutoSplit.t
PASS: cpan/B-Debug/t/debug.t
PASS: cpan/CGI/t/apache.t
PASS: cpan/CGI/t/autoescape.t
PASS: cpan/CGI/t/can.t
PASS: cpan/CGI/t/carp.t
PASS: cpan/CGI/t/charset.t
PASS: cpan/CGI/t/checkbox_group.t
PASS: cpan/CGI/t/cookie.t
PASS: cpan/CGI/t/Dump.t
PASS: cpan/CGI/t/end_form.t
PASS: cpan/CGI/t/form.t
PASS: cpan/CGI/t/function.t
PASS: cpan/CGI/t/headers.t
PASS: cpan/CGI/t/hidden.t
PASS: cpan/CGI/t/html.t
PASS: cpan/CGI/t/http.t
PASS: cpan/CGI/t/init.t
PASS: cpan/CGI/t/no_tabindex.t
PASS: cpan/CGI/t/param_fetch.t
PASS: cpan/CGI/t/popup_menu.t
PASS: cpan/CGI/t/pretty.t
PASS: cpan/CGI/t/push.t
PASS: cpan/CGI/t/query_string.t
PASS: cpan/CGI/t/request.t
PASS: cpan/CGI/t/save_read_roundtrip.t
PASS: cpan/CGI/t/start_end_asterisk.t
PASS: cpan/CGI/t/start_end_end.t
PASS: cpan/CGI/t/start_end_start.t
PASS: cpan/CGI/t/switch.t
PASS: cpan/CGI/t/unescapeHTML.t
PASS: cpan/CGI/t/uploadInfo.t
PASS: cpan/CGI/t/upload.t
PASS: cpan/CGI/t/url.t
PASS: cpan/CGI/t/user_agent.t
PASS: cpan/CGI/t/utf8.t
PASS: cpan/CGI/t/util-58.t
PASS: cpan/CGI/t/util.t
PASS: cpan/Compress-Raw-Bzip2/t/000prereq.t
PASS: cpan/Compress-Raw-Bzip2/t/01bzip2.t
PASS: cpan/Compress-Raw-Bzip2/t/09limitoutput.t
SKIP: cpan/Compress-Raw-Bzip2/t/99pod.t
PASS: cpan/Compress-Raw-Zlib/t/01version.t
PASS: cpan/Compress-Raw-Zlib/t/02zlib.t
PASS: cpan/Compress-Raw-Zlib/t/07bufsize.t
PASS: cpan/Compress-Raw-Zlib/t/09limitoutput.t
PASS: cpan/Compress-Raw-Zlib/t/18lvalue.t
PASS: cpan/CPAN-Meta/t/converter-bad.t
PASS: cpan/CPAN-Meta/t/converter-fail.t
PASS: cpan/CPAN-Meta/t/converter.t
PASS: cpan/CPAN-Meta/t/load-bad.t
PASS: cpan/CPAN-Meta/t/meta-obj.t
PASS: cpan/CPAN-Meta/t/no-index.t
PASS: cpan/CPAN-Meta/t/prereqs-finalize.t
PASS: cpan/CPAN-Meta/t/prereqs-merge.t
PASS: cpan/CPAN-Meta/t/prereqs.t
PASS: cpan/CPAN-Meta/t/repository.t
PASS: cpan/CPAN-Meta/t/save-load.t
PASS: cpan/CPAN-Meta/t/validator.t
PASS: cpan/CPAN-Meta-YAML/t/01_compile.t
PASS: cpan/CPAN-Meta-YAML/t/02_basic.t
PASS: cpan/CPAN-Meta-YAML/t/03_regression.t
PASS: cpan/CPAN-Meta-YAML/t/05_export.t
PASS: cpan/CPAN-Meta-YAML/t/11_meta_yml.t
PASS: cpan/CPAN-Meta-YAML/t/12_plagger.t
PASS: cpan/CPAN-Meta-YAML/t/13_perl_smith.t
PASS: cpan/CPAN-Meta-YAML/t/14_yaml_org.t
PASS: cpan/CPAN-Meta-YAML/t/15_multibyte.t
PASS: cpan/CPAN-Meta-YAML/t/16_nullrefs.t
PASS: cpan/CPAN-Meta-YAML/t/17_toolbar.t
PASS: cpan/CPAN-Meta-YAML/t/18_tap.t
PASS: cpan/CPAN-Meta-YAML/t/19_errors.t
PASS: cpan/CPAN-Meta-YAML/t/20_subclass.t
PASS: cpan/CPAN-Meta-YAML/t/21_bom.t
PASS: cpan/CPAN-Meta-YAML/t/22_comments.t
PASS: cpan/CPANPLUS-Dist-Build/t/01_CPANPLUS-Dist-Build-Constants.t
[ERROR] You do not have 'Module::Build' -- 'CPANPLUS::Dist::Build' not avai=
lable

#   Failed test 'Format is available'
#   at t/02_CPANPLUS-Dist-Build.t line 94.
FAIL: cpan/CPANPLUS-Dist-Build/t/02_CPANPLUS-Dist-Build.t
FAILED at test 2
PASS: cpan/CPANPLUS/t/00_CPANPLUS-Internals-Utils.t
PASS: cpan/CPANPLUS/t/01_CPANPLUS-Configure.t
PASS: cpan/CPANPLUS/t/02_CPANPLUS-Internals.t
PASS: cpan/CPANPLUS/t/03_CPANPLUS-Internals-Source.t
#   Failed test '   Tested prereqs'
#   at t/04_CPANPLUS-Module.t line 309.
FAIL: cpan/CPANPLUS/t/04_CPANPLUS-Module.t
FAILED at test 109
PASS: cpan/CPANPLUS/t/05_CPANPLUS-Internals-Fetch.t
PASS: cpan/CPANPLUS/t/06_CPANPLUS-Internals-Constants.t
PASS: cpan/CPANPLUS/t/07_CPANPLUS-Internals-Extract.t
PASS: cpan/CPANPLUS/t/08_CPANPLUS-Backend.t
PASS: cpan/CPANPLUS/t/09_CPANPLUS-Internals-Search.t
PASS: cpan/CPANPLUS/t/10_CPANPLUS-Error.t
PASS: cpan/CPANPLUS/t/15_CPANPLUS-Shell.t
PASS: cpan/CPANPLUS/t/19_CPANPLUS-Dist.t
make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', need=
ed by `Makefile'.  Stop.
#   Failed test 'Testing module'
#   at t/20_CPANPLUS-Dist-MM.t line 108.
FAIL: cpan/CPANPLUS/t/20_CPANPLUS-Dist-MM.t
FAILED at test 11
PASS: cpan/CPANPLUS/t/21_CPANPLUS-Dist-No-Build.t
PASS: cpan/CPANPLUS/t/25_CPANPLUS.t
PASS: cpan/CPANPLUS/t/30_CPANPLUS-Internals-Selfupdate.t
PASS: cpan/CPANPLUS/t/40_CPANPLUS-Internals-Report.t
PASS: cpan/CPAN/t/01loadme.t
PASS: cpan/CPAN/t/02nox.t
PASS: cpan/CPAN/t/03pkgs.t
PASS: cpan/CPAN/t/10version.t
PASS: cpan/CPAN/t/11mirroredby.t
FAIL: cpan/Devel-DProf/t/DProf.t
FAILED--expected 20 tests, saw 0
PASS: cpan/Devel-PPPort/t/call.t
PASS: cpan/Devel-PPPort/t/cop.t
PASS: cpan/Devel-PPPort/t/exception.t
PASS: cpan/Devel-PPPort/t/format.t
PASS: cpan/Devel-PPPort/t/grok.t
PASS: cpan/Devel-PPPort/t/gv.t
PASS: cpan/Devel-PPPort/t/HvNAME.t
PASS: cpan/Devel-PPPort/t/limits.t
PASS: cpan/Devel-PPPort/t/magic.t
PASS: cpan/Devel-PPPort/t/memory.t
PASS: cpan/Devel-PPPort/t/misc.t
PASS: cpan/Devel-PPPort/t/mPUSH.t
PASS: cpan/Devel-PPPort/t/MY_CXT.t
PASS: cpan/Devel-PPPort/t/newCONSTSUB.t
PASS: cpan/Devel-PPPort/t/newRV.t
PASS: cpan/Devel-PPPort/t/newSVpv.t
PASS: cpan/Devel-PPPort/t/newSV_type.t
PASS: cpan/Devel-PPPort/t/podtest.t
PASS: cpan/Devel-PPPort/t/ppphtest.t
PASS: cpan/Devel-PPPort/t/pvs.t
PASS: cpan/Devel-PPPort/t/pv_tools.t
PASS: cpan/Devel-PPPort/t/shared_pv.t
PASS: cpan/Devel-PPPort/t/snprintf.t
PASS: cpan/Devel-PPPort/t/sprintf.t
PASS: cpan/Devel-PPPort/t/strlfuncs.t
PASS: cpan/Devel-PPPort/t/SvPV.t
PASS: cpan/Devel-PPPort/t/SvREFCNT.t
PASS: cpan/Devel-PPPort/t/Sv_set.t
PASS: cpan/Devel-PPPort/t/sv_xpvf.t
PASS: cpan/Devel-PPPort/t/threads.t
PASS: cpan/Devel-PPPort/t/uv.t
PASS: cpan/Devel-PPPort/t/variables.t
PASS: cpan/Devel-PPPort/t/warn.t
PASS: cpan/Digest-MD5/t/align.t
PASS: cpan/Digest-MD5/t/badfile.t
PASS: cpan/Digest-MD5/t/bits.t
PASS: cpan/Digest-MD5/t/clone.t
PASS: cpan/Digest-MD5/t/files.t
PASS: cpan/Digest-MD5/t/md5-aaa.t
PASS: cpan/Digest-MD5/t/threads.t
PASS: cpan/Digest-MD5/t/utf8.t
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/allfcns.t line 19.
FAIL: cpan/Digest-SHA/t/allfcns.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/base64.t line 10.
FAIL: cpan/Digest-SHA/t/base64.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/bitbuf.t line 9.
FAIL: cpan/Digest-SHA/t/bitbuf.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/dumpload.t line 10.
FAIL: cpan/Digest-SHA/t/dumpload.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/fips180-4.t line 9.
FAIL: cpan/Digest-SHA/t/fips180-4.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/fips198.t line 9.
FAIL: cpan/Digest-SHA/t/fips198.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/gglong.t line 14.
FAIL: cpan/Digest-SHA/t/gglong.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/gg.t line 13.
FAIL: cpan/Digest-SHA/t/gg.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/hmacsha.t line 11.
FAIL: cpan/Digest-SHA/t/hmacsha.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/ireland.t line 10.
FAIL: cpan/Digest-SHA/t/ireland.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/methods.t line 10.
FAIL: cpan/Digest-SHA/t/methods.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/nistbit.t line 13.
FAIL: cpan/Digest-SHA/t/nistbit.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/nistbyte.t line 13.
FAIL: cpan/Digest-SHA/t/nistbyte.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/rfc2202.t line 9.
FAIL: cpan/Digest-SHA/t/rfc2202.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha1.t line 9.
FAIL: cpan/Digest-SHA/t/sha1.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha224.t line 9.
FAIL: cpan/Digest-SHA/t/sha224.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha256.t line 9.
FAIL: cpan/Digest-SHA/t/sha256.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha384.t line 9.
FAIL: cpan/Digest-SHA/t/sha384.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha512.t line 9.
FAIL: cpan/Digest-SHA/t/sha512.t
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/woodbury.t line 13.
FAIL: cpan/Digest-SHA/t/woodbury.t
FAILED--no leader found
PASS: cpan/Digest/t/base.t
PASS: cpan/Digest/t/digest.t
PASS: cpan/Digest/t/file.t
PASS: cpan/Digest/t/security.t
PASS: cpan/Encode/t/Aliases.t
PASS: cpan/Encode/t/at-cn.t
PASS: cpan/Encode/t/at-tw.t
PASS: cpan/Encode/t/CJKT.t
PASS: cpan/Encode/t/enc_data.t
PASS: cpan/Encode/t/enc_eucjp.t
PASS: cpan/Encode/t/enc_module.t
PASS: cpan/Encode/t/Encoder.t
PASS: cpan/Encode/t/Encode.t
PASS: cpan/Encode/t/encoding.t
PASS: cpan/Encode/t/enc_utf8.t
PASS: cpan/Encode/t/fallback.t
PASS: cpan/Encode/t/from_to.t
PASS: cpan/Encode/t/grow.t
PASS: cpan/Encode/t/gsm0338.t
PASS: cpan/Encode/t/guess.t
PASS: cpan/Encode/t/jis7-fallback.t
PASS: cpan/Encode/t/jperl.t
PASS: cpan/Encode/t/mime_header_iso2022jp.t
PASS: cpan/Encode/t/mime-header.t
PASS: cpan/Encode/t/mime-name.t
PASS: cpan/Encode/t/perlio.t
SKIP: cpan/Encode/t/piconv.t
PASS: cpan/Encode/t/Unicode.t
PASS: cpan/Encode/t/utf8ref.t
PASS: cpan/Encode/t/utf8strict.t
PASS: cpan/encoding-warnings/t/1-warning.t
PASS: cpan/encoding-warnings/t/2-fatal.t
PASS: cpan/encoding-warnings/t/3-normal.t
PASS: cpan/encoding-warnings/t/4-lexical.t
PERL_CORE is set but I can't find your PERL_SRC!
make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', need=
ed by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-Constant/t/Constant.t
FAILED at test 3
Can't open MANIFEST: No such file or directory at t/00compile.t line 17.
FAIL: cpan/ExtUtils-MakeMaker/t/00compile.t
FAILED--no leader found
PASS: cpan/ExtUtils-MakeMaker/t/arch_check.t
PASS: cpan/ExtUtils-MakeMaker/t/backwards.t
#   Failed test 'make manifest created a MANIFEST'
#   at t/basic.t line 70.
FAIL: cpan/ExtUtils-MakeMaker/t/basic.t
FAILED at test 8
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PASS: cpan/ExtUtils-MakeMaker/t/build_man.t
PASS: cpan/ExtUtils-MakeMaker/t/cd.t
PASS: cpan/ExtUtils-MakeMaker/t/config.t
PASS: cpan/ExtUtils-MakeMaker/t/dir_target.t
PASS: cpan/ExtUtils-MakeMaker/t/FIRST_MAKEFILE.t
PASS: cpan/ExtUtils-MakeMaker/t/fixin.t
PASS: cpan/ExtUtils-MakeMaker/t/fix_libs.t
PASS: cpan/ExtUtils-MakeMaker/t/hints.t
#   Failed test '  make install exited normally'
#   at t/INSTALL_BASE.t line 46.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
FAILED at test 5
PASS: cpan/ExtUtils-MakeMaker/t/installed_file.t
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
#   Failed test 'PERL_SRC'
#   at t/INST_PREFIX.t line 111.
#          got: undef
#     expected: '../../../..'
FAIL: cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
FAILED at test 13
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
#   Failed test 'PERL_SRC'
#   at t/INST.t line 78.
#          got: undef
#     expected: '../../../..'
FAIL: cpan/ExtUtils-MakeMaker/t/INST.t
FAILED at test 9
PASS: cpan/ExtUtils-MakeMaker/t/is_of_type.t
PASS: cpan/ExtUtils-MakeMaker/t/Liblist.t
PASS: cpan/ExtUtils-MakeMaker/t/MakeMaker_Parameters.t
PASS: cpan/ExtUtils-MakeMaker/t/make.t
PASS: cpan/ExtUtils-MakeMaker/t/maketext_filter.t
PASS: cpan/ExtUtils-MakeMaker/t/metafile_data.t
PASS: cpan/ExtUtils-MakeMaker/t/metafile_file.t
#   Failed test 'run(make)'
#   at t/miniperl.t line 49.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/miniperl.t
FAILED at test 5
#   Failed test 'Make ppd exiting normally'
#   at t/min_perl_version.t line 168.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
Can't open Min-PerlVers.ppd for reading: No such file or directory at t/lib=
/MakeMaker/Test/Utils.pm line 397.
No root path(s) specified
 at t/min_perl_version.t line 193
FAIL: cpan/ExtUtils-MakeMaker/t/min_perl_version.t
FAILED at test 26
PASS: cpan/ExtUtils-MakeMaker/t/Mkbootstrap.t
PASS: cpan/ExtUtils-MakeMaker/t/MM_Any.t
SKIP: cpan/ExtUtils-MakeMaker/t/MM_BeOS.t
SKIP: cpan/ExtUtils-MakeMaker/t/MM_Cygwin.t
SKIP: cpan/ExtUtils-MakeMaker/t/MM_NW5.t
SKIP: cpan/ExtUtils-MakeMaker/t/MM_OS2.t
PASS: cpan/ExtUtils-MakeMaker/t/MM_Unix.t
SKIP: cpan/ExtUtils-MakeMaker/t/MM_VMS.t
SKIP: cpan/ExtUtils-MakeMaker/t/MM_Win32.t
PASS: cpan/ExtUtils-MakeMaker/t/oneliner.t
PASS: cpan/ExtUtils-MakeMaker/t/parse_abstract.t
PASS: cpan/ExtUtils-MakeMaker/t/parse_version.t
#   Failed test at t/PL_FILES.t line 32.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/PL_FILES.t
FAILED at test 3
PERL_CORE is set but I can't find your PERL_SRC!
PASS: cpan/ExtUtils-MakeMaker/t/pm.t
#   Failed test 'run(make)'
#   at t/pm_to_blib.t line 41.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
FAILED at test 4
PASS: cpan/ExtUtils-MakeMaker/t/pod2man.t
#   Failed test 'postamble argument not warned about'
#   at t/postamble.t line 46.
#          got: 'PERL_CORE is set but I can't find your PERL_SRC!
# '
#     expected: ''
FAIL: cpan/ExtUtils-MakeMaker/t/postamble.t
FAILED at test 4
PASS: cpan/ExtUtils-MakeMaker/t/prefixify.t
PASS: cpan/ExtUtils-MakeMaker/t/prereq_print.t
PASS: cpan/ExtUtils-MakeMaker/t/prereq.t
PASS: cpan/ExtUtils-MakeMaker/t/problems.t
PASS: cpan/ExtUtils-MakeMaker/t/prompt.t
#   Failed test 'recursive make exited normally'
#   at t/recurs.t line 55.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/recurs.t
FAILED at test 6
PASS: cpan/ExtUtils-MakeMaker/t/revision.t
#   Failed test 'Make ppd exiting normally'
#   at t/several_authors.t line 103.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
Can't open Multiple-Authors.ppd for reading: No such file or directory at t=
/lib/MakeMaker/Test/Utils.pm line 397.
No root path(s) specified
 at t/several_authors.t line 120
FAIL: cpan/ExtUtils-MakeMaker/t/several_authors.t
FAILED at test 11
PASS: cpan/ExtUtils-MakeMaker/t/split_command.t
PASS: cpan/ExtUtils-MakeMaker/t/test_boilerplate.t
PASS: cpan/ExtUtils-MakeMaker/t/testlib.t
PASS: cpan/ExtUtils-MakeMaker/t/VERSION_FROM.t
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PASS: cpan/ExtUtils-MakeMaker/t/WriteEmptyMakefile.t
#   Failed test at t/writemakefile_args.t line 49.
#          got: 'WARNING: MAN3PODS takes a HASH reference not a string/numb=
er.
#          Please inform the author.
# PERL_CORE is set but I can't find your PERL_SRC!
# '
#     expected: 'WARNING: MAN3PODS takes a HASH reference not a string/numb=
er.
#          Please inform the author.
# '
FAIL: cpan/ExtUtils-MakeMaker/t/writemakefile_args.t
FAILED at test 4
SKIP: cpan/ExtUtils-MakeMaker/t/xs.t
PASS: cpan/File-Fetch/t/01_File-Fetch.t
PASS: cpan/File-Fetch/t/null_subclass.t
PASS: cpan/File-Path/t/Path.t
PASS: cpan/File-Path/t/taint.t
PASS: cpan/File-Temp/t/cmp.t
PASS: cpan/File-Temp/t/fork.t
SKIP: cpan/File-Temp/t/lock.t
PASS: cpan/File-Temp/t/mktemp.t
PASS: cpan/File-Temp/t/object.t
PASS: cpan/File-Temp/t/posix.t
PASS: cpan/File-Temp/t/security.t
PASS: cpan/File-Temp/t/seekable.t
PASS: cpan/File-Temp/t/tempfile.t
Can't locate filter-util.pl in @INC (@INC contains: ../../lib ../../t .) at=
 t/call.t line 10.
BEGIN failed--compilation aborted at t/call.t line 11.
FAIL: cpan/Filter-Util-Call/t/call.t
FAILED--no leader found
PASS: cpan/Getopt-Long/t/gol-basic.t
PASS: cpan/Getopt-Long/t/gol-compat.t
PASS: cpan/Getopt-Long/t/gol-linkage.t
PASS: cpan/Getopt-Long/t/gol-oo.t
PASS: cpan/Getopt-Long/t/gol-xargv.t
PASS: cpan/Getopt-Long/t/gol-xstring.t
PASS: cpan/HTTP-Tiny/t/000_load.t
PASS: cpan/HTTP-Tiny/t/001_api.t
PASS: cpan/HTTP-Tiny/t/002_croakage.t
Can't stat lib: No such file or directory
 at t/00-compile.t line 32
SKIP: cpan/HTTP-Tiny/t/00-compile.t
PASS: cpan/HTTP-Tiny/t/010_url.t
PASS: cpan/HTTP-Tiny/t/020_headers.t
PASS: cpan/HTTP-Tiny/t/030_response.t
PASS: cpan/HTTP-Tiny/t/040_content.t
PASS: cpan/HTTP-Tiny/t/050_chunked_body.t
PASS: cpan/HTTP-Tiny/t/060_http_date.t
PASS: cpan/HTTP-Tiny/t/100_get.t
PASS: cpan/HTTP-Tiny/t/110_mirror.t
PASS: cpan/HTTP-Tiny/t/120_put.t
PASS: cpan/HTTP-Tiny/t/130_redirect.t
PASS: cpan/IO-Compress/t/000prereq.t
PASS: cpan/IO-Compress/t/001bzip2.t
PASS: cpan/IO-Compress/t/001zlib-generic-deflate.t
PASS: cpan/IO-Compress/t/001zlib-generic-gzip.t
PASS: cpan/IO-Compress/t/001zlib-generic-rawdeflate.t
PASS: cpan/IO-Compress/t/001zlib-generic-zip.t
PASS: cpan/IO-Compress/t/002any-deflate.t
PASS: cpan/IO-Compress/t/002any-gzip.t
PASS: cpan/IO-Compress/t/002any-rawdeflate.t
PASS: cpan/IO-Compress/t/002any-transparent.t
PASS: cpan/IO-Compress/t/002any-zip.t
PASS: cpan/IO-Compress/t/004gziphdr.t
PASS: cpan/IO-Compress/t/005defhdr.t
PASS: cpan/IO-Compress/t/006zip.t
#   Failed test '  exit status is 0'
#   at t/010examples-bzip2.t line 92.
#          got: '512'
#     expected: '0'
FAIL: cpan/IO-Compress/t/010examples-bzip2.t
FAILED at test 2
#   Failed test '  exit status is 0'
#   at t/010examples-zlib.t line 92.
#          got: '512'
#     expected: '0'
FAIL: cpan/IO-Compress/t/010examples-zlib.t
FAILED at test 2
PASS: cpan/IO-Compress/t/01misc.t
SKIP: cpan/IO-Compress/t/020isize.t
PASS: cpan/IO-Compress/t/050interop-gzip.t
PASS: cpan/IO-Compress/t/100generic-bzip2.t
PASS: cpan/IO-Compress/t/100generic-deflate.t
PASS: cpan/IO-Compress/t/100generic-gzip.t
PASS: cpan/IO-Compress/t/100generic-rawdeflate.t
PASS: cpan/IO-Compress/t/100generic-zip.t
PASS: cpan/IO-Compress/t/101truncate-bzip2.t
PASS: cpan/IO-Compress/t/101truncate-deflate.t
PASS: cpan/IO-Compress/t/101truncate-gzip.t
PASS: cpan/IO-Compress/t/101truncate-rawdeflate.t
PASS: cpan/IO-Compress/t/101truncate-zip.t
PASS: cpan/IO-Compress/t/102tied-bzip2.t
PASS: cpan/IO-Compress/t/102tied-deflate.t
PASS: cpan/IO-Compress/t/102tied-gzip.t
PASS: cpan/IO-Compress/t/102tied-rawdeflate.t
PASS: cpan/IO-Compress/t/102tied-zip.t
PASS: cpan/IO-Compress/t/103newtied-bzip2.t
PASS: cpan/IO-Compress/t/103newtied-deflate.t
PASS: cpan/IO-Compress/t/103newtied-gzip.t
PASS: cpan/IO-Compress/t/103newtied-rawdeflate.t
PASS: cpan/IO-Compress/t/103newtied-zip.t
PASS: cpan/IO-Compress/t/104destroy-bzip2.t
PASS: cpan/IO-Compress/t/104destroy-deflate.t
PASS: cpan/IO-Compress/t/104destroy-gzip.t
PASS: cpan/IO-Compress/t/104destroy-rawdeflate.t
PASS: cpan/IO-Compress/t/104destroy-zip.t
PASS: cpan/IO-Compress/t/105oneshot-bzip2.t
PASS: cpan/IO-Compress/t/105oneshot-deflate.t
PASS: cpan/IO-Compress/t/105oneshot-gzip-only.t
PASS: cpan/IO-Compress/t/105oneshot-gzip.t
PASS: cpan/IO-Compress/t/105oneshot-rawdeflate.t
PASS: cpan/IO-Compress/t/105oneshot-zip-bzip2-only.t
PASS: cpan/IO-Compress/t/105oneshot-zip-only.t
PASS: cpan/IO-Compress/t/105oneshot-zip.t
PASS: cpan/IO-Compress/t/106prime-bzip2.t
PASS: cpan/IO-Compress/t/106prime-deflate.t
PASS: cpan/IO-Compress/t/106prime-gzip.t
PASS: cpan/IO-Compress/t/106prime-rawdeflate.t
PASS: cpan/IO-Compress/t/106prime-zip.t
PASS: cpan/IO-Compress/t/107multi-bzip2.t
PASS: cpan/IO-Compress/t/107multi-deflate.t
PASS: cpan/IO-Compress/t/107multi-gzip.t
PASS: cpan/IO-Compress/t/107multi-rawdeflate.t
PASS: cpan/IO-Compress/t/107multi-zip.t
PASS: cpan/IO-Compress/t/108anyunc-bzip2.t
PASS: cpan/IO-Compress/t/108anyunc-deflate.t
PASS: cpan/IO-Compress/t/108anyunc-gzip.t
PASS: cpan/IO-Compress/t/108anyunc-rawdeflate.t
PASS: cpan/IO-Compress/t/108anyunc-transparent.t
PASS: cpan/IO-Compress/t/108anyunc-zip.t
PASS: cpan/IO-Compress/t/109merge-deflate.t
PASS: cpan/IO-Compress/t/109merge-gzip.t
PASS: cpan/IO-Compress/t/109merge-rawdeflate.t
SKIP: cpan/IO-Compress/t/109merge-zip.t
PASS: cpan/IO-Compress/t/110encode-bzip2.t
PASS: cpan/IO-Compress/t/110encode-deflate.t
PASS: cpan/IO-Compress/t/110encode-gzip.t
PASS: cpan/IO-Compress/t/110encode-rawdeflate.t
PASS: cpan/IO-Compress/t/110encode-zip.t
SKIP: cpan/IO-Compress/t/999pod.t
PASS: cpan/IO-Compress/t/cz-01version.t
PASS: cpan/IO-Compress/t/cz-03zlib-v1.t
#   Failed test '  exit status is 0'
#   at t/cz-05examples.t line 96.
#          got: '512'
#     expected: '0'
FAIL: cpan/IO-Compress/t/cz-05examples.t
FAILED at test 2
PASS: cpan/IO-Compress/t/cz-06gzsetp.t
PASS: cpan/IO-Compress/t/cz-08encoding.t
PASS: cpan/IO-Compress/t/cz-14gzopen.t
PASS: cpan/IO-Compress/t/globmapper.t
PASS: cpan/IO-Zlib/t/basic.t
SKIP: cpan/IO-Zlib/t/external.t
PASS: cpan/IO-Zlib/t/getc.t
PASS: cpan/IO-Zlib/t/getline.t
PASS: cpan/IO-Zlib/t/import.t
PASS: cpan/IO-Zlib/t/large.t
PASS: cpan/IO-Zlib/t/tied.t
PASS: cpan/IO-Zlib/t/uncomp1.t
PASS: cpan/IO-Zlib/t/uncomp2.t
PASS: cpan/IPC-Cmd/t/01_IPC-Cmd.t
SKIP: cpan/IPC-Cmd/t/02_Interactive.t
PASS: cpan/IPC-SysV/t/ipcsysv.t
PASS: cpan/IPC-SysV/t/msg.t
SKIP: cpan/IPC-SysV/t/podcov.t
SKIP: cpan/IPC-SysV/t/pod.t
PASS: cpan/IPC-SysV/t/sem.t
PASS: cpan/IPC-SysV/t/shm.t
PASS: cpan/JSON-PP/t/000_load.t
PASS: cpan/JSON-PP/t/001_utf8.t
PASS: cpan/JSON-PP/t/002_error.t
PASS: cpan/JSON-PP/t/003_types.t
PASS: cpan/JSON-PP/t/006_pc_pretty.t
PASS: cpan/JSON-PP/t/007_pc_esc.t
PASS: cpan/JSON-PP/t/008_pc_base.t
PASS: cpan/JSON-PP/t/009_pc_extra_number.t
PASS: cpan/JSON-PP/t/010_pc_keysort.t
PASS: cpan/JSON-PP/t/011_pc_expo.t
PASS: cpan/JSON-PP/t/012_blessed.t
PASS: cpan/JSON-PP/t/013_limit.t
PASS: cpan/JSON-PP/t/014_latin1.t
PASS: cpan/JSON-PP/t/015_prefix.t
PASS: cpan/JSON-PP/t/016_tied.t
PASS: cpan/JSON-PP/t/017_relaxed.t
PASS: cpan/JSON-PP/t/018_json_checker.t
PASS: cpan/JSON-PP/t/019_incr.t
PASS: cpan/JSON-PP/t/020_unknown.t
PASS: cpan/JSON-PP/t/021_evans_bugrep.t
PASS: cpan/JSON-PP/t/022_comment_at_eof.t
PASS: cpan/JSON-PP/t/099_binary.t
PASS: cpan/JSON-PP/t/104_sortby.t
PASS: cpan/JSON-PP/t/105_esc_slash.t
PASS: cpan/JSON-PP/t/106_allow_barekey.t
PASS: cpan/JSON-PP/t/107_allow_singlequote.t
PASS: cpan/JSON-PP/t/108_decode.t
PASS: cpan/JSON-PP/t/109_encode.t
PASS: cpan/JSON-PP/t/110_bignum.t
PASS: cpan/JSON-PP/t/112_upgrade.t
PASS: cpan/JSON-PP/t/113_overloaded_eq.t
PASS: cpan/JSON-PP/t/114_decode_prefix.t
PASS: cpan/JSON-PP/t/115_tie_ixhash.t
SKIP: cpan/libnet/t/config.t
SKIP: cpan/libnet/t/datasend.t
SKIP: cpan/libnet/t/ftp.t
SKIP: cpan/libnet/t/hostname.t
SKIP: cpan/libnet/t/netrc.t
SKIP: cpan/libnet/t/nntp.t
SKIP: cpan/libnet/t/require.t
SKIP: cpan/libnet/t/smtp.t
SKIP: cpan/libnet/t/time.t
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/00version.t lin=
e 7.
BEGIN failed--compilation aborted at t/00version.t line 14.
FAIL: cpan/List-Util/t/00version.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/blessed.t line =
7.
BEGIN failed--compilation aborted at t/blessed.t line 14.
FAIL: cpan/List-Util/t/blessed.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/dualvar.t line =
7.
BEGIN failed--compilation aborted at t/dualvar.t line 14.
FAIL: cpan/List-Util/t/dualvar.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/expfail.t line =
7.
BEGIN failed--compilation aborted at t/expfail.t line 14.
FAIL: cpan/List-Util/t/expfail.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/first.t line 7.
BEGIN failed--compilation aborted at t/first.t line 14.
FAIL: cpan/List-Util/t/first.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/isvstring.t lin=
e 7.
BEGIN failed--compilation aborted at t/isvstring.t line 14.
FAIL: cpan/List-Util/t/isvstring.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/lln.t line 7.
BEGIN failed--compilation aborted at t/lln.t line 14.
FAIL: cpan/List-Util/t/lln.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/maxstr.t line 7=
.
BEGIN failed--compilation aborted at t/maxstr.t line 14.
FAIL: cpan/List-Util/t/maxstr.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/max.t line 7.
BEGIN failed--compilation aborted at t/max.t line 14.
FAIL: cpan/List-Util/t/max.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/minstr.t line 7=
.
BEGIN failed--compilation aborted at t/minstr.t line 14.
FAIL: cpan/List-Util/t/minstr.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/min.t line 7.
BEGIN failed--compilation aborted at t/min.t line 14.
FAIL: cpan/List-Util/t/min.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/openhan.t line =
7.
BEGIN failed--compilation aborted at t/openhan.t line 14.
FAIL: cpan/List-Util/t/openhan.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/p_00version.t l=
ine 7.
BEGIN failed--compilation aborted at t/p_00version.t line 14.
FAIL: cpan/List-Util/t/p_00version.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/blessed.t line =
7.
BEGIN failed--compilation aborted at t/blessed.t line 14.
FAIL: cpan/List-Util/t/p_blessed.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/first.t line 7.
BEGIN failed--compilation aborted at t/first.t line 14.
FAIL: cpan/List-Util/t/p_first.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/lln.t line 7.
BEGIN failed--compilation aborted at t/lln.t line 14.
FAIL: cpan/List-Util/t/p_lln.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/maxstr.t line 7=
.
BEGIN failed--compilation aborted at t/maxstr.t line 14.
FAIL: cpan/List-Util/t/p_maxstr.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/max.t line 7.
BEGIN failed--compilation aborted at t/max.t line 14.
FAIL: cpan/List-Util/t/p_max.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/minstr.t line 7=
.
BEGIN failed--compilation aborted at t/minstr.t line 14.
FAIL: cpan/List-Util/t/p_minstr.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/min.t line 7.
BEGIN failed--compilation aborted at t/min.t line 14.
FAIL: cpan/List-Util/t/p_min.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/openhan.t line =
7.
BEGIN failed--compilation aborted at t/openhan.t line 14.
FAIL: cpan/List-Util/t/p_openhan.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/readonly.t line=
 7.
BEGIN failed--compilation aborted at t/readonly.t line 14.
FAIL: cpan/List-Util/t/p_readonly.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reduce.t line 7=
.
BEGIN failed--compilation aborted at t/reduce.t line 14.
FAIL: cpan/List-Util/t/p_reduce.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/refaddr.t line =
7.
BEGIN failed--compilation aborted at t/refaddr.t line 14.
FAIL: cpan/List-Util/t/p_refaddr.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reftype.t line =
7.
BEGIN failed--compilation aborted at t/reftype.t line 14.
FAIL: cpan/List-Util/t/p_reftype.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/proto.t line 7.
BEGIN failed--compilation aborted at t/proto.t line 14.
FAIL: cpan/List-Util/t/proto.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/shuffle.t line =
7.
BEGIN failed--compilation aborted at t/shuffle.t line 14.
FAIL: cpan/List-Util/t/p_shuffle.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/sum.t line 7.
BEGIN failed--compilation aborted at t/sum.t line 14.
FAIL: cpan/List-Util/t/p_sum.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at ./t/tainted.t lin=
e 7.
BEGIN failed--compilation aborted at ./t/tainted.t line 17.
FAIL: cpan/List-Util/t/p_tainted.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/readonly.t line=
 7.
BEGIN failed--compilation aborted at t/readonly.t line 14.
FAIL: cpan/List-Util/t/readonly.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reduce.t line 7=
.
BEGIN failed--compilation aborted at t/reduce.t line 14.
FAIL: cpan/List-Util/t/reduce.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/refaddr.t line =
7.
BEGIN failed--compilation aborted at t/refaddr.t line 14.
FAIL: cpan/List-Util/t/refaddr.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reftype.t line =
7.
BEGIN failed--compilation aborted at t/reftype.t line 14.
FAIL: cpan/List-Util/t/reftype.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/shuffle.t line =
7.
BEGIN failed--compilation aborted at t/shuffle.t line 14.
FAIL: cpan/List-Util/t/shuffle.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/stack-corruptio=
n.t line 7.
BEGIN failed--compilation aborted at t/stack-corruption.t line 18.
FAIL: cpan/List-Util/t/stack-corruption.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/sum.t line 7.
BEGIN failed--compilation aborted at t/sum.t line 14.
FAIL: cpan/List-Util/t/sum.t
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/tainted.t line =
7.
BEGIN failed--compilation aborted at t/tainted.t line 17.
FAIL: cpan/List-Util/t/tainted.t
FAILED--no leader found
Can't locate Config_heavy.pl in @INC (@INC contains: ../lib) at ../../lib/C=
onfig.pm line 79.
BEGIN failed--compilation aborted at t/weak.t line 15.
FAIL: cpan/List-Util/t/weak.t
FAILED--no leader found
PASS: cpan/Locale-Codes/t/alias_code.t
PASS: cpan/Locale-Codes/t/code2country.t
PASS: cpan/Locale-Codes/t/code2currency.t
PASS: cpan/Locale-Codes/t/code2language.t
PASS: cpan/Locale-Codes/t/code2script.t
PASS: cpan/Locale-Codes/t/country2code.t
PASS: cpan/Locale-Codes/t/country_code2code.t
PASS: cpan/Locale-Codes/t/country.t
PASS: cpan/Locale-Codes/t/currency2code.t
PASS: cpan/Locale-Codes/t/language2code.t
PASS: cpan/Locale-Codes/t/language.t
PASS: cpan/Locale-Codes/t/script2code.t
PASS: cpan/Locale-Maketext-Simple/t/0-signature.t
PASS: cpan/Locale-Maketext-Simple/t/1-basic.t
SKIP: cpan/Locale-Maketext-Simple/t/2-load_po_without_i_default.t
SKIP: cpan/Locale-Maketext-Simple/t/3-load_po_with_i_default.t
PASS: cpan/Log-Message-Simple/t/01_use.t
PASS: cpan/Log-Message-Simple/t/02_imports.t
PASS: cpan/Log-Message-Simple/t/03_functions.t
PASS: cpan/Log-Message/t/01_Log-Message-Config.t
PASS: cpan/Log-Message/t/02_Log-Message.t
PASS: cpan/Math-Complex/t/Complex.t
PASS: cpan/Math-Complex/t/Trig.t
PASS: cpan/Math-Complex/t/underbar.t
PASS: cpan/Memoize/t/array_confusion.t
PASS: cpan/Memoize/t/array.t
PASS: cpan/Memoize/t/correctness.t
PASS: cpan/Memoize/t/errors.t
PASS: cpan/Memoize/t/expfile.t
PASS: cpan/Memoize/t/expire.t
PASS: cpan/Memoize/t/expmod_n.t
PASS: cpan/Memoize/t/expmod_t.t
PASS: cpan/Memoize/t/flush.t
PASS: cpan/Memoize/t/normalize.t
PASS: cpan/Memoize/t/prototype.t
PASS: cpan/Memoize/t/speed.t
PASS: cpan/Memoize/t/tiefeatures.t
PASS: cpan/Memoize/t/tie_gdbm.t
SKIP: cpan/Memoize/t/tie_ndbm.t
PASS: cpan/Memoize/t/tie_sdbm.t
PASS: cpan/Memoize/t/tie_storable.t
PASS: cpan/Memoize/t/tie.t
PASS: cpan/Memoize/t/unmemoize.t
PASS: cpan/MIME-Base64/t/base64.t
PASS: cpan/MIME-Base64/t/length.t
PASS: cpan/MIME-Base64/t/quoted-print.t
PASS: cpan/MIME-Base64/t/unicode.t
Can't stat lib: No such file or directory
 at t/00-compile.t line 8
You said to run 0 tests at t/00-compile.t line 10.
FAIL: cpan/Module-Build/t/00-compile.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/actions/installdeps.t
FAILED--expected 6 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/actions/manifest_skip.t
FAILED--expected 7 tests, saw 0
Can't locate Module/Metadata.pm in @INC (@INC contains: /usr/lib/perl/ptest=
/cpan/Module-Build/t/lib /usr/lib/perl/ptest/cpan/Module-Build/../../lib /u=
sr/lib/perl/ptest/cpan/Module-Build/../../t /usr/lib/perl/ptest/cpan/Module=
-Build /usr/lib/perl/ptest/cpan/Module-Build/t/bundled .) at /usr/lib/perl/=
ptest/cpan/Module-Build/../../lib/Module/Build/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 2.
	...propagated at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/base.pm l=
ine 94.
BEGIN failed--compilation aborted at t/add_property.t line 18.
# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/add_property.t
FAILED--expected 27 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/basic.t
FAILED--expected 58 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 23) line 1.

FAIL: cpan/Module-Build/t/bundle_inc.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/compat/exit.t
FAILED--expected 3 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/compat.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/debug.t
FAILED--expected 1 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/destinations.t
FAILED--expected 113 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/extend.t
FAILED--expected 64 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 13) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/ext.t
FAILED--expected 185 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/files.t
FAILED--expected 4 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/help.t
FAILED--expected 23 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/install_extra_target.t
FAILED--expected 6 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/install.t
FAILED--expected 34 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

FAIL: cpan/Module-Build/t/manifypods.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/metadata2.t
FAILED--expected 18 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/metadata.t
FAILED--expected 52 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 16) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/mymeta.t
FAILED--expected 39 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/new_from_context.t
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/notes.t
FAILED--expected 11 tests, saw 0
Can't locate Module/Metadata.pm in @INC (@INC contains: /usr/lib/perl/ptest=
/cpan/Module-Build/t/lib /usr/lib/perl/ptest/cpan/Module-Build/../../lib /u=
sr/lib/perl/ptest/cpan/Module-Build/../../t /usr/lib/perl/ptest/cpan/Module=
-Build /usr/lib/perl/ptest/cpan/Module-Build/t/bundled .) at /usr/lib/perl/=
ptest/cpan/Module-Build/../../lib/Module/Build/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 13) line 2.
	...propagated at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/base.pm l=
ine 94.
BEGIN failed--compilation aborted at t/parents.t line 15.
# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/parents.t
FAILED--expected 26 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/perl_mb_opt.t
FAILED--expected 8 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/PL_files.t
FAILED--expected 8 tests, saw 0
PASS: cpan/Module-Build/t/pod_parser.t
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

FAIL: cpan/Module-Build/t/ppm.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/dist_suffix.t
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/license.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/module_name.t
FAILED--expected 4 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/needs_compiler.t
FAILED--expected 19 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/release_status.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/requires.t
FAILED--expected 4 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/share_dir.t
FAILED--expected 21 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/resume.t
FAILED--expected 3 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/runthrough.t
FAILED--expected 29 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/sample.t
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 16) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/script_dist.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/test_file_exts.t
FAILED--expected 3 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/test_types.t
FAILED--expected 25 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/test_type.t
FAILED--expected 7 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/tilde.t
FAILED--expected 16 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 17) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/use_tap_harness.t
FAILED--expected 9 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/versions.t
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/write_default_maniskip.t
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

FAIL: cpan/Module-Build/t/xs.t
FAILED--no leader found
PASS: cpan/Module-Load-Conditional/t/01_Module_Load_Conditional.t
PASS: cpan/Module-Load-Conditional/t/02_Parse_Version.t
PASS: cpan/Module-Loaded/t/01_Module-Loaded.t
PASS: cpan/Module-Load/t/01_Module-Load.t
#   Failed test 'require Module::Metadata;'
#   at t/metadata.t line 178.
#     Tried to require 'Module::Metadata'.
#     Error:  Can't locate Module/Metadata.pm in @INC (@INC contains: /usr/=
lib/perl/ptest/cpan/Module-Metadata/t/lib /usr/lib/perl/ptest/cpan/Module-M=
etadata/../../lib /usr/lib/perl/ptest/cpan/Module-Metadata/../../t /usr/lib=
/perl/ptest/cpan/Module-Metadata /usr/lib/perl/ptest/cpan/Module-Metadata/t=
/bundled .) at (eval 14) line 2.
Can't locate object method "find_module_by_name" via package "Module::Metad=
ata" at t/metadata.t line 181.
# Looks like you planned 99 tests but ran 1.
# Looks like you failed 1 test of 1 run.
# Looks like your test exited with 255 just after 1.
FAIL: cpan/Module-Metadata/t/metadata.t
FAILED at test 1
PASS: cpan/Module-Pluggable/t/01use.t
PASS: cpan/Module-Pluggable/t/02alsoworks.t
PASS: cpan/Module-Pluggable/t/02works.t
PASS: cpan/Module-Pluggable/t/02works_taint.t
PASS: cpan/Module-Pluggable/t/03diffname.t
PASS: cpan/Module-Pluggable/t/04acmedir_single.t
PASS: cpan/Module-Pluggable/t/04acmedir.t
PASS: cpan/Module-Pluggable/t/04acmepath_single.t
PASS: cpan/Module-Pluggable/t/04acmepath.t
PASS: cpan/Module-Pluggable/t/05postpath.t
PASS: cpan/Module-Pluggable/t/06multipath.t
PASS: cpan/Module-Pluggable/t/07instantiate.t
PASS: cpan/Module-Pluggable/t/08nothing.t
PASS: cpan/Module-Pluggable/t/09require.t
PASS: cpan/Module-Pluggable/t/10innerpack_inner.t
PASS: cpan/Module-Pluggable/t/10innerpack_noinner.t
PASS: cpan/Module-Pluggable/t/10innerpack_onefile.t
PASS: cpan/Module-Pluggable/t/10innerpack_override.t
PASS: cpan/Module-Pluggable/t/10innerpack_super.t
PASS: cpan/Module-Pluggable/t/10innerpack.t
PASS: cpan/Module-Pluggable/t/11usetwice.t
PASS: cpan/Module-Pluggable/t/12onlyarray.t
PASS: cpan/Module-Pluggable/t/12onlyregex.t
PASS: cpan/Module-Pluggable/t/12onlyrequire.t
PASS: cpan/Module-Pluggable/t/12only.t
PASS: cpan/Module-Pluggable/t/13exceptarray.t
PASS: cpan/Module-Pluggable/t/13exceptregex.t
PASS: cpan/Module-Pluggable/t/13except.t
PASS: cpan/Module-Pluggable/t/14package.t
PASS: cpan/Module-Pluggable/t/15topicsafe.t
PASS: cpan/Module-Pluggable/t/16different_extension.t
PASS: cpan/Module-Pluggable/t/17devel_inner_package.t
PASS: cpan/Module-Pluggable/t/18skipped_package.t
PASS: cpan/Module-Pluggable/t/19can_ok_clobber.t
PASS: cpan/Module-Pluggable/t/20dodgy_files.t
PASS: cpan/Module-Pluggable/t/21editor_junk.t
PASS: cpan/NEXT/t/actual.t
PASS: cpan/NEXT/t/actuns.t
PASS: cpan/NEXT/t/dynamically_scoped_regex_vars.t
PASS: cpan/NEXT/t/next.t
PASS: cpan/NEXT/t/stringify.t
PASS: cpan/NEXT/t/unseen.t
PASS: cpan/Object-Accessor/t/00_Object-Accessor.t
PASS: cpan/Object-Accessor/t/01_Object-Accessor-Subclassed.t
PASS: cpan/Object-Accessor/t/02_Object-Accessor-allow.t
PASS: cpan/Object-Accessor/t/03_Object-Accessor-local.t
PASS: cpan/Object-Accessor/t/04_Object-Accessor-lvalue.t
PASS: cpan/Object-Accessor/t/05_Object-Accessor-callback.t
PASS: cpan/Object-Accessor/t/06_Object-Accessor-alias.t
PASS: cpan/Package-Constants/t/01_list.t
PASS: cpan/Params-Check/t/01_Params-Check.t
PASS: cpan/parent/t/compile-time-file.t
PASS: cpan/parent/t/compile-time.t
PASS: cpan/parent/t/parent-classfromclassfile.t
PASS: cpan/parent/t/parent-classfromfile.t
PASS: cpan/parent/t/parent-pmc.t
PASS: cpan/parent/t/parent-returns-false.t
PASS: cpan/parent/t/parent.t
PASS: cpan/Parse-CPAN-Meta/t/01_compile.t
PASS: cpan/Parse-CPAN-Meta/t/02_api.t
PASS: cpan/Parse-CPAN-Meta/t/03_functions.t
PASS: cpan/Parse-CPAN-Meta/t/04_export.t
PASS: cpan/Parse-CPAN-Meta/t/05_errors.t
PASS: cpan/PerlIO-via-QuotedPrint/t/QuotedPrint.t
Can't stat lib: No such file or directory
 at t/00-compile.t line 29
SKIP: cpan/Perl-OSType/t/00-compile.t
PASS: cpan/Perl-OSType/t/OSType.t
PASS: cpan/Pod-Escapes/t/01_about_verbose.t
PASS: cpan/Pod-Escapes/t/10_main.t
PASS: cpan/Pod-Escapes/t/15_name2charnum.t
PASS: cpan/Pod-LaTeX/t/pod2latex.t
PASS: cpan/Pod-LaTeX/t/user.t
PASS: cpan/podlators/t/basic.t
PASS: cpan/podlators/t/color.t
PASS: cpan/podlators/t/devise-date.t
PASS: cpan/podlators/t/filehandle.t
PASS: cpan/podlators/t/man-heading.t
PASS: cpan/podlators/t/man-options.t
PASS: cpan/podlators/t/man-perlio.t
PASS: cpan/podlators/t/man.t
PASS: cpan/podlators/t/man-utf8.t
PASS: cpan/podlators/t/overstrike.t
PASS: cpan/podlators/t/parselink.t
PASS: cpan/podlators/t/pod-parser.t
SKIP: cpan/podlators/t/pod-spelling.t
SKIP: cpan/podlators/t/pod.t
PASS: cpan/podlators/t/termcap.t
PASS: cpan/podlators/t/text-encoding.t
PASS: cpan/podlators/t/text-options.t
PASS: cpan/podlators/t/text-perlio.t
PASS: cpan/podlators/t/text.t
PASS: cpan/podlators/t/text-utf8.t
PASS: cpan/Pod-Parser/t/pod/contains_pod.t
PASS: cpan/Pod-Parser/t/pod/emptycmd.t
#   Failed test at t/pod/find.t line 84.
#          got: ''
#     expected: 'Pod::Checker,Pod::Find,Pod::InputObjects,Pod::ParseUtils,P=
od::Parser,Pod::PlainText,Pod::Select,Pod::Usage'
FAIL: cpan/Pod-Parser/t/pod/find.t
FAILED at test 2
PASS: cpan/Pod-Parser/t/pod/for.t
PASS: cpan/Pod-Parser/t/pod/headings.t
PASS: cpan/Pod-Parser/t/pod/included.t
PASS: cpan/Pod-Parser/t/pod/include.t
PASS: cpan/Pod-Parser/t/pod/lref.t
PASS: cpan/Pod-Parser/t/pod/multiline_items.t
PASS: cpan/Pod-Parser/t/pod/nested_items.t
PASS: cpan/Pod-Parser/t/pod/nested_seqs.t
PASS: cpan/Pod-Parser/t/pod/oneline_cmds.t
PASS: cpan/Pod-Parser/t/pod/pod2usage2.t
*** Can't find =3Dinclude file pod2usage.PL in t/pod t /usr/lib/perl/ptest/=
cpan/Pod-Parser/lib/Pod /usr/lib/perl/ptest/cpan/Pod-Parser/scripts /usr/li=
b/perl/ptest/cpan/Pod-Parser/pod /usr/lib/perl/ptest/cpan/Pod-Parser/t/pod =
../../pod
t/pod/pod2usage.OUT is shorter than t/pod/pod2usage.xr
FAIL: cpan/Pod-Parser/t/pod/pod2usage.t
FAILED at test 1
PASS: cpan/Pod-Parser/t/pod/podchkenc.t
PASS: cpan/Pod-Parser/t/pod/poderrs.t
*** Can't find =3Dinclude file podselect.PL in t/pod t /usr/lib/perl/ptest/=
cpan/Pod-Parser/lib/Pod /usr/lib/perl/ptest/cpan/Pod-Parser/scripts /usr/li=
b/perl/ptest/cpan/Pod-Parser/pod /usr/lib/perl/ptest/cpan/Pod-Parser/t/pod =
../../pod
t/pod/podselect.OUT is shorter than t/pod/podselect.xr
FAIL: cpan/Pod-Parser/t/pod/podselect.t
FAILED at test 1
PASS: cpan/Pod-Parser/t/pod/special_seqs.t
PASS: cpan/Pod-Parser/t/pod/twice.t
PASS: cpan/Pod-Simple/t/00about.t
PASS: cpan/Pod-Simple/t/20_skip.t
PASS: cpan/Pod-Simple/t/accept01.t
PASS: cpan/Pod-Simple/t/accept05.t
PASS: cpan/Pod-Simple/t/ac_d.t
PASS: cpan/Pod-Simple/t/basic.t
PASS: cpan/Pod-Simple/t/begin.t
PASS: cpan/Pod-Simple/t/cbacks.t
PASS: cpan/Pod-Simple/t/chunking.t
PASS: cpan/Pod-Simple/t/closeys.t
PASS: cpan/Pod-Simple/t/corpus.t
PASS: cpan/Pod-Simple/t/encod01.t
PASS: cpan/Pod-Simple/t/encod02.t
PASS: cpan/Pod-Simple/t/encod03.t
PASS: cpan/Pod-Simple/t/end_over.t
PASS: cpan/Pod-Simple/t/fcodes_e.t
PASS: cpan/Pod-Simple/t/fcodes_l.t
PASS: cpan/Pod-Simple/t/fcodes_s.t
PASS: cpan/Pod-Simple/t/fcodes.t
PASS: cpan/Pod-Simple/t/fornot.t
PASS: cpan/Pod-Simple/t/for.t
PASS: cpan/Pod-Simple/t/heads.t
PASS: cpan/Pod-Simple/t/html01.t
PASS: cpan/Pod-Simple/t/html02.t
PASS: cpan/Pod-Simple/t/html03.t
PASS: cpan/Pod-Simple/t/htmlbat.t
PASS: cpan/Pod-Simple/t/items02.t
PASS: cpan/Pod-Simple/t/items.t
PASS: cpan/Pod-Simple/t/itemstar.t
PASS: cpan/Pod-Simple/t/linkclas.t
PASS: cpan/Pod-Simple/t/output.t
PASS: cpan/Pod-Simple/t/puller.t
PASS: cpan/Pod-Simple/t/pulltitl.t
PASS: cpan/Pod-Simple/t/reinit.t
PASS: cpan/Pod-Simple/t/render.t
PASS: cpan/Pod-Simple/t/search05.t
PASS: cpan/Pod-Simple/t/search10.t
PASS: cpan/Pod-Simple/t/search12.t
PASS: cpan/Pod-Simple/t/search20.t
PASS: cpan/Pod-Simple/t/search22.t
PASS: cpan/Pod-Simple/t/search25.t
PASS: cpan/Pod-Simple/t/search26.t
PASS: cpan/Pod-Simple/t/search27.t
PASS: cpan/Pod-Simple/t/search28.t
PASS: cpan/Pod-Simple/t/search29.t
PASS: cpan/Pod-Simple/t/search50.t
PASS: cpan/Pod-Simple/t/stree.t
PASS: cpan/Pod-Simple/t/strpvbtm.t
PASS: cpan/Pod-Simple/t/tiedfh.t
PASS: cpan/Pod-Simple/t/verbatim.t
PASS: cpan/Pod-Simple/t/verb_fmt.t
PASS: cpan/Pod-Simple/t/xhtml01.t
PASS: cpan/Pod-Simple/t/xhtml05.t
PASS: cpan/Pod-Simple/t/xhtml10.t
PASS: cpan/Pod-Simple/t/x_nixer.t
PASS: cpan/Shell/t/Shell.t
PASS: cpan/Sys-Syslog/t/00-load.t
SKIP: cpan/Sys-Syslog/t/constants.t
PASS: cpan/Sys-Syslog/t/syslog.t
PASS: cpan/Term-ANSIColor/t/basic.t
SKIP: cpan/Term-Cap/test.pl
PASS: cpan/Term-UI/t/00_load.t
PASS: cpan/Term-UI/t/01_history.t
PASS: cpan/Term-UI/t/02_ui.t
Can't read MANIFEST: No such file or directory at t/000-load.t line 87.
FAIL: cpan/Test-Harness/t/000-load.t
FAILED--no leader found
PASS: cpan/Test-Harness/t/aggregator.t
PASS: cpan/Test-Harness/t/bailout.t
PASS: cpan/Test-Harness/t/base.t
PASS: cpan/Test-Harness/t/callbacks.t
PASS: cpan/Test-Harness/t/compat/env.t
PASS: cpan/Test-Harness/t/compat/failure.t
PASS: cpan/Test-Harness/t/compat/inc-propagation.t
PASS: cpan/Test-Harness/t/compat/inc_taint.t
SKIP: cpan/Test-Harness/t/compat/nonumbers.t
PASS: cpan/Test-Harness/t/compat/regression.t
PASS: cpan/Test-Harness/t/compat/subclass.t
PASS: cpan/Test-Harness/t/compat/switches.t
PASS: cpan/Test-Harness/t/compat/test-harness-compat.t
PASS: cpan/Test-Harness/t/compat/version.t
PASS: cpan/Test-Harness/t/console.t
PASS: cpan/Test-Harness/t/errors.t
PASS: cpan/Test-Harness/t/file.t
PASS: cpan/Test-Harness/t/glob-to-regexp.t
PASS: cpan/Test-Harness/t/grammar.t
PASS: cpan/Test-Harness/t/harness-bailout.t
PASS: cpan/Test-Harness/t/harness-subclass.t
PASS: cpan/Test-Harness/t/harness.t
PASS: cpan/Test-Harness/t/iterator_factory.t
PASS: cpan/Test-Harness/t/iterators.t
PASS: cpan/Test-Harness/t/multiplexer.t
PASS: cpan/Test-Harness/t/nested.t
PASS: cpan/Test-Harness/t/nofork-mux.t
PASS: cpan/Test-Harness/t/nofork.t
PASS: cpan/Test-Harness/t/object.t
PASS: cpan/Test-Harness/t/parser-config.t
PASS: cpan/Test-Harness/t/parser-subclass.t
PASS: cpan/Test-Harness/t/parse.t
PASS: cpan/Test-Harness/t/perl5lib.t
PASS: cpan/Test-Harness/t/premature-bailout.t
PASS: cpan/Test-Harness/t/process.t
PASS: cpan/Test-Harness/t/proveenv.t
PASS: cpan/Test-Harness/t/proverc.t
PASS: cpan/Test-Harness/t/proverun.t
PASS: cpan/Test-Harness/t/prove.t
PASS: cpan/Test-Harness/t/proveversion.t
PASS: cpan/Test-Harness/t/regression.t
PASS: cpan/Test-Harness/t/results.t
PASS: cpan/Test-Harness/t/scheduler.t
PASS: cpan/Test-Harness/t/source_handler.t
PASS: cpan/Test-Harness/t/source.t
PASS: cpan/Test-Harness/t/source_tests/source.t
PASS: cpan/Test-Harness/t/spool.t
PASS: cpan/Test-Harness/t/state_results.t
PASS: cpan/Test-Harness/t/state.t
PASS: cpan/Test-Harness/t/streams.t
PASS: cpan/Test-Harness/t/taint.t
PASS: cpan/Test-Harness/t/testargs.t
PASS: cpan/Test-Harness/t/unicode.t
PASS: cpan/Test-Harness/t/utils.t
PASS: cpan/Test-Harness/t/yamlish-output.t
PASS: cpan/Test-Harness/t/yamlish.t
PASS: cpan/Test-Harness/t/yamlish-writer.t
PASS: cpan/Test-Simple/examples/subtest.t
PASS: cpan/Test-Simple/t/00test_harness_check.t
PASS: cpan/Test-Simple/t/bad_plan.t
PASS: cpan/Test-Simple/t/bail_out.t
PASS: cpan/Test-Simple/t/BEGIN_require_ok.t
PASS: cpan/Test-Simple/t/BEGIN_use_ok.t
PASS: cpan/Test-Simple/t/buffer.t
PASS: cpan/Test-Simple/t/Builder/Builder.t
PASS: cpan/Test-Simple/t/Builder/carp.t
PASS: cpan/Test-Simple/t/Builder/create.t
PASS: cpan/Test-Simple/t/Builder/current_test.t
PASS: cpan/Test-Simple/t/Builder/current_test_without_plan.t
PASS: cpan/Test-Simple/t/Builder/details.t
PASS: cpan/Test-Simple/t/Builder/done_testing_double.t
PASS: cpan/Test-Simple/t/Builder/done_testing_plan_mismatch.t
PASS: cpan/Test-Simple/t/Builder/done_testing.t
PASS: cpan/Test-Simple/t/Builder/done_testing_with_no_plan.t
PASS: cpan/Test-Simple/t/Builder/done_testing_with_number.t
PASS: cpan/Test-Simple/t/Builder/done_testing_with_plan.t
PASS: cpan/Test-Simple/t/Builder/fork_with_new_stdout.t
PASS: cpan/Test-Simple/t/Builder/has_plan2.t
PASS: cpan/Test-Simple/t/Builder/has_plan.t
PASS: cpan/Test-Simple/t/Builder/is_fh.t
PASS: cpan/Test-Simple/t/Builder/is_passing.t
PASS: cpan/Test-Simple/t/Builder/maybe_regex.t
PASS: cpan/Test-Simple/t/Builder/no_diag.t
PASS: cpan/Test-Simple/t/Builder/no_ending.t
PASS: cpan/Test-Simple/t/Builder/no_header.t
PASS: cpan/Test-Simple/t/Builder/no_plan_at_all.t
PASS: cpan/Test-Simple/t/Builder/ok_obj.t
PASS: cpan/Test-Simple/t/Builder/output.t
PASS: cpan/Test-Simple/t/Builder/reset.t
PASS: cpan/Test-Simple/t/Builder/try.t
PASS: cpan/Test-Simple/t/c_flag.t
PASS: cpan/Test-Simple/t/circular_data.t
PASS: cpan/Test-Simple/t/cmp_ok.t
SKIP: cpan/Test-Simple/t/dependents.t
PASS: cpan/Test-Simple/t/diag.t
PASS: cpan/Test-Simple/t/died.t
PASS: cpan/Test-Simple/t/dont_overwrite_die_handler.t
PASS: cpan/Test-Simple/t/eq_set.t
PASS: cpan/Test-Simple/t/exit.t
PASS: cpan/Test-Simple/t/explain.t
PASS: cpan/Test-Simple/t/extra_one.t
PASS: cpan/Test-Simple/t/extra.t
PASS: cpan/Test-Simple/t/fail-like.t
PASS: cpan/Test-Simple/t/fail-more.t
PASS: cpan/Test-Simple/t/fail_one.t
PASS: cpan/Test-Simple/t/fail.t
PASS: cpan/Test-Simple/t/filehandles.t
PASS: cpan/Test-Simple/t/fork.t
PASS: cpan/Test-Simple/t/harness_active.t
PASS: cpan/Test-Simple/t/import.t
PASS: cpan/Test-Simple/t/is_deeply_dne_bug.t
PASS: cpan/Test-Simple/t/is_deeply_fail.t
SKIP: cpan/Test-Simple/t/is_deeply_with_threads.t
PASS: cpan/Test-Simple/t/missing.t
PASS: cpan/Test-Simple/t/More.t
PASS: cpan/Test-Simple/t/new_ok.t
PASS: cpan/Test-Simple/t/no_plan.t
PASS: cpan/Test-Simple/t/no_tests.t
PASS: cpan/Test-Simple/t/note.t
PASS: cpan/Test-Simple/t/overload.t
PASS: cpan/Test-Simple/t/overload_threads.t
PASS: cpan/Test-Simple/t/plan_bad.t
PASS: cpan/Test-Simple/t/plan_is_noplan.t
PASS: cpan/Test-Simple/t/plan_no_plan.t
PASS: cpan/Test-Simple/t/plan_shouldnt_import.t
SKIP: cpan/Test-Simple/t/plan_skip_all.t
PASS: cpan/Test-Simple/t/plan.t
PASS: cpan/Test-Simple/t/require_ok.t
PASS: cpan/Test-Simple/t/Simple/load.t
PASS: cpan/Test-Simple/t/simple.t
PASS: cpan/Test-Simple/t/skipall.t
PASS: cpan/Test-Simple/t/skip.t
PASS: cpan/Test-Simple/t/subtest/args.t
PASS: cpan/Test-Simple/t/subtest/basic.t
PASS: cpan/Test-Simple/t/subtest/die.t
PASS: cpan/Test-Simple/t/subtest/do.t
PASS: cpan/Test-Simple/t/subtest/exceptions.t
PASS: cpan/Test-Simple/t/subtest/fork.t
PASS: cpan/Test-Simple/t/subtest/implicit_done.t
PASS: cpan/Test-Simple/t/subtest/line_numbers.t
PASS: cpan/Test-Simple/t/subtest/plan.t
PASS: cpan/Test-Simple/t/subtest/predicate.t
PASS: cpan/Test-Simple/t/subtest/singleton.t
PASS: cpan/Test-Simple/t/subtest/todo.t
PASS: cpan/Test-Simple/t/subtest/wstat.t
PASS: cpan/Test-Simple/t/tbm_doesnt_set_exported_to.t
PASS: cpan/Test-Simple/t/Tester/tbt_01basic.t
PASS: cpan/Test-Simple/t/Tester/tbt_02fhrestore.t
PASS: cpan/Test-Simple/t/Tester/tbt_03die.t
PASS: cpan/Test-Simple/t/Tester/tbt_04line_num.t
PASS: cpan/Test-Simple/t/Tester/tbt_05faildiag.t
PASS: cpan/Test-Simple/t/Tester/tbt_06errormess.t
PASS: cpan/Test-Simple/t/Tester/tbt_07args.t
PASS: cpan/Test-Simple/t/threads.t
PASS: cpan/Test-Simple/t/thread_taint.t
PASS: cpan/Test-Simple/t/todo.t
PASS: cpan/Test-Simple/t/undef.t
PASS: cpan/Test-Simple/t/useing.t
PASS: cpan/Test-Simple/t/use_ok.t
PASS: cpan/Test-Simple/t/utf8.t
PASS: cpan/Test-Simple/t/versions.t
PASS: cpan/Test/t/05_about_verbose.t
PASS: cpan/Test/t/fail.t
PASS: cpan/Test/t/mix.t
PASS: cpan/Test/t/multiline.t
PASS: cpan/Test/t/onfail.t
PASS: cpan/Test/t/qr.t
PASS: cpan/Test/t/skip.t
PASS: cpan/Test/t/success.t
PASS: cpan/Test/t/todo.t
PASS: cpan/Text-Balanced/t/01_compile.t
PASS: cpan/Text-Balanced/t/02_extbrk.t
PASS: cpan/Text-Balanced/t/03_extcbk.t
PASS: cpan/Text-Balanced/t/04_extdel.t
PASS: cpan/Text-Balanced/t/05_extmul.t
PASS: cpan/Text-Balanced/t/06_extqlk.t
PASS: cpan/Text-Balanced/t/07_exttag.t
PASS: cpan/Text-Balanced/t/08_extvar.t
PASS: cpan/Text-Balanced/t/09_gentag.t
PASS: cpan/Text-ParseWords/t/ParseWords.t
PASS: cpan/Text-ParseWords/t/taint.t
PASS: cpan/Text-Soundex/t/Soundex.t
PASS: cpan/Text-Tabs/t/37000.t
PASS: cpan/Text-Tabs/t/39548.t
PASS: cpan/Text-Tabs/t/belg4mit.t
PASS: cpan/Text-Tabs/t/dandv.t
PASS: cpan/Text-Tabs/t/fill.t
PASS: cpan/Text-Tabs/t/Jacobson2.t
PASS: cpan/Text-Tabs/t/Jacobson.t
PASS: cpan/Text-Tabs/t/Jochen.t
PASS: cpan/Text-Tabs/t/sep2.t
PASS: cpan/Text-Tabs/t/sep.t
PASS: cpan/Text-Tabs/t/tabs.t
PASS: cpan/Text-Tabs/t/wrap_separator2.t
PASS: cpan/Text-Tabs/t/wrap.t
PASS: cpan/Tie-File/t/00_version.t
PASS: cpan/Tie-File/t/01_gen.t
PASS: cpan/Tie-File/t/02_fetchsize.t
PASS: cpan/Tie-File/t/03_longfetch.t
PASS: cpan/Tie-File/t/04_splice.t
PASS: cpan/Tie-File/t/05_size.t
PASS: cpan/Tie-File/t/06_fixrec.t
PASS: cpan/Tie-File/t/07_rv_splice.t
PASS: cpan/Tie-File/t/08_ro.t
PASS: cpan/Tie-File/t/09_gen_rs.t
PASS: cpan/Tie-File/t/10_splice_rs.t
PASS: cpan/Tie-File/t/11_rv_splice_rs.t
PASS: cpan/Tie-File/t/12_longfetch_rs.t
PASS: cpan/Tie-File/t/13_size_rs.t
PASS: cpan/Tie-File/t/14_lock.t
PASS: cpan/Tie-File/t/15_pushpop.t
PASS: cpan/Tie-File/t/16_handle.t
PASS: cpan/Tie-File/t/17_misc_meth.t
PASS: cpan/Tie-File/t/18_rs_fixrec.t
PASS: cpan/Tie-File/t/19_cache.t
PASS: cpan/Tie-File/t/20_cache_full.t
SKIP: cpan/Tie-File/t/21_win32.t
PASS: cpan/Tie-File/t/22_autochomp.t
PASS: cpan/Tie-File/t/23_rv_ac_splice.t
PASS: cpan/Tie-File/t/24_cache_loop.t
PASS: cpan/Tie-File/t/25_gen_nocache.t
PASS: cpan/Tie-File/t/26_twrite.t
PASS: cpan/Tie-File/t/27_iwrite.t
PASS: cpan/Tie-File/t/28_mtwrite.t
PASS: cpan/Tie-File/t/29a_upcopy.t
PASS: cpan/Tie-File/t/29_downcopy.t
PASS: cpan/Tie-File/t/30_defer.t
PASS: cpan/Tie-File/t/31_autodefer.t
PASS: cpan/Tie-File/t/32_defer_misc.t
PASS: cpan/Tie-File/t/33_defer_vs.t
PASS: cpan/Tie-File/t/40_abs_cache.t
PASS: cpan/Tie-File/t/41_heap.t
PASS: cpan/Tie-File/t/42_offset.t
PASS: cpan/Tie-RefHash/t/rebless.t
PASS: cpan/Tie-RefHash/t/refhash.t
PASS: cpan/Tie-RefHash/t/storable.t
PASS: cpan/Tie-RefHash/t/threaded.t
PASS: cpan/Time-HiRes/t/HiRes.t
PASS: cpan/Time-Local/t/Local.t
PASS: cpan/Time-Piece/t/01base.t
PASS: cpan/Time-Piece/t/02core.t
PASS: cpan/Time-Piece/t/03compare.t
PASS: cpan/Time-Piece/t/04mjd.t
PASS: cpan/Time-Piece/t/05overload.t
PASS: cpan/Time-Piece/t/06subclass.t
PASS: cpan/Time-Piece/t/07arith.t
PASS: cpan/Unicode-Collate/t/altern.t
PASS: cpan/Unicode-Collate/t/backwds.t
PASS: cpan/Unicode-Collate/t/cjk_b5.t
PASS: cpan/Unicode-Collate/t/cjk_gb.t
PASS: cpan/Unicode-Collate/t/cjk_ja.t
PASS: cpan/Unicode-Collate/t/cjk_ko.t
PASS: cpan/Unicode-Collate/t/cjk_py.t
PASS: cpan/Unicode-Collate/t/cjkrange.t
PASS: cpan/Unicode-Collate/t/cjk_st.t
PASS: cpan/Unicode-Collate/t/compatui.t
PASS: cpan/Unicode-Collate/t/contract.t
PASS: cpan/Unicode-Collate/t/default.t
PASS: cpan/Unicode-Collate/t/hangtype.t
PASS: cpan/Unicode-Collate/t/hangul.t
PASS: cpan/Unicode-Collate/t/ignor.t
PASS: cpan/Unicode-Collate/t/illegalp.t
PASS: cpan/Unicode-Collate/t/illegal.t
PASS: cpan/Unicode-Collate/t/index.t
PASS: cpan/Unicode-Collate/t/loc_af.t
PASS: cpan/Unicode-Collate/t/loc_ar.t
PASS: cpan/Unicode-Collate/t/loc_az.t
PASS: cpan/Unicode-Collate/t/loc_be.t
PASS: cpan/Unicode-Collate/t/loc_bg.t
PASS: cpan/Unicode-Collate/t/loc_ca.t
PASS: cpan/Unicode-Collate/t/loc_cs.t
PASS: cpan/Unicode-Collate/t/loc_cyrl.t
PASS: cpan/Unicode-Collate/t/loc_cy.t
PASS: cpan/Unicode-Collate/t/loc_da.t
PASS: cpan/Unicode-Collate/t/loc_deph.t
PASS: cpan/Unicode-Collate/t/loc_de.t
PASS: cpan/Unicode-Collate/t/loc_eo.t
PASS: cpan/Unicode-Collate/t/loc_es.t
PASS: cpan/Unicode-Collate/t/loc_estr.t
PASS: cpan/Unicode-Collate/t/loc_et.t
PASS: cpan/Unicode-Collate/t/loc_fil.t
PASS: cpan/Unicode-Collate/t/loc_fi.t
PASS: cpan/Unicode-Collate/t/loc_fo.t
PASS: cpan/Unicode-Collate/t/loc_fr.t
PASS: cpan/Unicode-Collate/t/loc_ha.t
PASS: cpan/Unicode-Collate/t/loc_haw.t
PASS: cpan/Unicode-Collate/t/loc_hr.t
PASS: cpan/Unicode-Collate/t/loc_hu.t
PASS: cpan/Unicode-Collate/t/loc_hy.t
PASS: cpan/Unicode-Collate/t/loc_ig.t
PASS: cpan/Unicode-Collate/t/loc_is.t
PASS: cpan/Unicode-Collate/t/loc_jait.t
PASS: cpan/Unicode-Collate/t/loc_japr.t
PASS: cpan/Unicode-Collate/t/loc_ja.t
PASS: cpan/Unicode-Collate/t/loc_kk.t
PASS: cpan/Unicode-Collate/t/loc_kl.t
PASS: cpan/Unicode-Collate/t/loc_ko.t
PASS: cpan/Unicode-Collate/t/loc_lt.t
PASS: cpan/Unicode-Collate/t/loc_lv.t
PASS: cpan/Unicode-Collate/t/loc_mk.t
PASS: cpan/Unicode-Collate/t/loc_mt.t
PASS: cpan/Unicode-Collate/t/loc_nb.t
PASS: cpan/Unicode-Collate/t/loc_nn.t
PASS: cpan/Unicode-Collate/t/loc_nso.t
PASS: cpan/Unicode-Collate/t/loc_om.t
PASS: cpan/Unicode-Collate/t/loc_pl.t
PASS: cpan/Unicode-Collate/t/loc_ro.t
PASS: cpan/Unicode-Collate/t/loc_ru.t
PASS: cpan/Unicode-Collate/t/loc_se.t
PASS: cpan/Unicode-Collate/t/loc_sk.t
PASS: cpan/Unicode-Collate/t/loc_sl.t
PASS: cpan/Unicode-Collate/t/loc_sq.t
PASS: cpan/Unicode-Collate/t/loc_sr.t
PASS: cpan/Unicode-Collate/t/loc_sv.t
PASS: cpan/Unicode-Collate/t/loc_sw.t
PASS: cpan/Unicode-Collate/t/loc_test.t
PASS: cpan/Unicode-Collate/t/loc_tn.t
PASS: cpan/Unicode-Collate/t/loc_to.t
PASS: cpan/Unicode-Collate/t/loc_tr.t
PASS: cpan/Unicode-Collate/t/loc_uk.t
PASS: cpan/Unicode-Collate/t/loc_vi.t
PASS: cpan/Unicode-Collate/t/loc_wo.t
PASS: cpan/Unicode-Collate/t/loc_yo.t
PASS: cpan/Unicode-Collate/t/loc_zhb5.t
PASS: cpan/Unicode-Collate/t/loc_zhgb.t
PASS: cpan/Unicode-Collate/t/loc_zhpy.t
PASS: cpan/Unicode-Collate/t/loc_zhst.t
PASS: cpan/Unicode-Collate/t/loc_zh.t
PASS: cpan/Unicode-Collate/t/nonchar.t
PASS: cpan/Unicode-Collate/t/normal.t
PASS: cpan/Unicode-Collate/t/overcjk0.t
PASS: cpan/Unicode-Collate/t/overcjk1.t
PASS: cpan/Unicode-Collate/t/override.t
PASS: cpan/Unicode-Collate/t/rearrang.t
PASS: cpan/Unicode-Collate/t/test.t
PASS: cpan/Unicode-Collate/t/trailwt.t
PASS: cpan/Unicode-Collate/t/variable.t
PASS: cpan/Unicode-Collate/t/version.t
PASS: cpan/Unicode-Collate/t/view.t
PASS: cpan/Unicode-Normalize/t/fcdc.t
PASS: cpan/Unicode-Normalize/t/form.t
PASS: cpan/Unicode-Normalize/t/func.t
PASS: cpan/Unicode-Normalize/t/illegal.t
PASS: cpan/Unicode-Normalize/t/norm.t
PASS: cpan/Unicode-Normalize/t/null.t
PASS: cpan/Unicode-Normalize/t/partial1.t
PASS: cpan/Unicode-Normalize/t/partial2.t
PASS: cpan/Unicode-Normalize/t/proto.t
PASS: cpan/Unicode-Normalize/t/split.t
PASS: cpan/Unicode-Normalize/t/test.t
PASS: cpan/Unicode-Normalize/t/tie.t
PASS: cpan/Version-Requirements/t/accepts.t
PASS: cpan/Version-Requirements/t/basic.t
PASS: cpan/Version-Requirements/t/finalize.t
PASS: cpan/Version-Requirements/t/from-hash.t
PASS: cpan/Version-Requirements/t/merge.t
PASS: dist/Attribute-Handlers/t/constants.t
PASS: dist/Attribute-Handlers/t/data_convert.t
PASS: dist/Attribute-Handlers/t/linerep.t
PASS: dist/Attribute-Handlers/t/multi.t
PASS: dist/autouse/t/autouse.t
PASS: dist/base/t/base.t
PASS: dist/base/t/compile-time.t
SKIP: dist/base/t/fields-5_6_0.t
SKIP: dist/base/t/fields-5_8_0.t
PASS: dist/base/t/fields-base.t
PASS: dist/base/t/fields.t
PASS: dist/base/t/isa.t
PASS: dist/base/t/sigdie.t
PASS: dist/base/t/version.t
PASS: dist/base/t/warnings.t
PASS: dist/B-Deparse/t/deparse.t
PASS: dist/bignum/t/big_e_pi.t
PASS: dist/bignum/t/bigexp.t
PASS: dist/bignum/t/bigint.t
PASS: dist/bignum/t/bignum.t
PASS: dist/bignum/t/bigrat.t
PASS: dist/bignum/t/bii_e_pi.t
PASS: dist/bignum/t/biinfnan.t
PASS: dist/bignum/t/bir_e_pi.t
PASS: dist/bignum/t/bninfnan.t
SKIP: dist/bignum/t/bn_lite.t
PASS: dist/bignum/t/brinfnan.t
SKIP: dist/bignum/t/br_lite.t
PASS: dist/bignum/t/in_effect.t
PASS: dist/bignum/t/option_a.t
PASS: dist/bignum/t/option_l.t
PASS: dist/bignum/t/option_p.t
PASS: dist/bignum/t/ratopt_a.t
PASS: dist/bignum/t/scope_f.t
PASS: dist/bignum/t/scope_i.t
PASS: dist/bignum/t/scope_r.t
PASS: dist/B-Lint/t/lint.t
PASS: dist/constant/t/constant.t
PASS: dist/constant/t/utf8.t
PASS: dist/Cwd/t/crossplatform.t
PASS: dist/Cwd/t/cwd.t
PASS: dist/Cwd/t/Functions.t
PASS: dist/Cwd/t/rel2abs2rel.t
PASS: dist/Cwd/t/Spec.t
PASS: dist/Cwd/t/taint.t
PASS: dist/Cwd/t/tmpdir.t
SKIP: dist/Cwd/t/win32.t
PASS: dist/Data-Dumper/t/bless.t
PASS: dist/Data-Dumper/t/bugs.t
PASS: dist/Data-Dumper/t/dumper.t
PASS: dist/Data-Dumper/t/freezer.t
PASS: dist/Data-Dumper/t/overload.t
PASS: dist/Data-Dumper/t/pair.t
PASS: dist/Data-Dumper/t/perl-74170.t
PASS: dist/Data-Dumper/t/terse.t
PASS: dist/Devel-SelfStubber/t/Devel-SelfStubber.t
PASS: dist/Dumpvalue/t/Dumpvalue.t
PASS: dist/Env/t/array.t
PASS: dist/Env/t/env.t
PERL_CORE is set but I can't find your perl source!
PERL_CORE is set but I can't find your perl source!
PERL_CORE is set but I can't find your perl source!
PERL_CORE is set but I can't find your perl source!
PASS: dist/ExtUtils-CBuilder/t/00-have-compiler.t
PERL_CORE is set but I can't find your perl source!
SKIP: dist/ExtUtils-CBuilder/t/01-basic.t
PERL_CORE is set but I can't find your perl source!
SKIP: dist/ExtUtils-CBuilder/t/02-link.t
PERL_CORE is set but I can't find your perl source!
SKIP: dist/ExtUtils-CBuilder/t/03-cplusplus.t
PERL_CORE is set but I can't find your perl source!
#   Failed test 'perl_inc() returned directory'
#   at t/04-base.t line 152.
FAIL: dist/ExtUtils-CBuilder/t/04-base.t
FAILED at test 24
PASS: dist/ExtUtils-Command/t/cp.t
PASS: dist/ExtUtils-Command/t/eu_command.t
PASS: dist/ExtUtils-Install/t/can_write_dir.t
PASS: dist/ExtUtils-Install/t/Installapi2.t
PASS: dist/ExtUtils-Install/t/Installed.t
PASS: dist/ExtUtils-Install/t/Install.t
#   Failed test 'make ran ok'
#   at t/InstallWithMM.t line 60.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: dist/ExtUtils-Install/t/InstallWithMM.t
FAILED at test 4
PASS: dist/ExtUtils-Install/t/Packlist.t
PASS: dist/ExtUtils-Manifest/t/Manifest.t
PERL_CORE is set but I can't find your perl source!
 at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/B=
ase.pm line 366
	ExtUtils::CBuilder::Base::perl_src('ExtUtils::CBuilder=3DHASH(0x8504c50)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 374
	ExtUtils::CBuilder::Base::perl_inc('ExtUtils::CBuilder=3DHASH(0x8504c50)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 154
	ExtUtils::CBuilder::Base::compile('ExtUtils::CBuilder=3DHASH(0x8504c50)', =
'C++', undef, 'source', 'compilet-axeJQ.c') called at /usr/lib/perl/ptest/d=
ist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 209
	eval {...} called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/E=
xtUtils/CBuilder/Base.pm line 206
	ExtUtils::CBuilder::Base::have_compiler('ExtUtils::CBuilder=3DHASH(0x8504c=
50)') called at t/basic.t line 36
PASS: dist/ExtUtils-ParseXS/t/basic.t
PERL_CORE is set but I can't find your perl source!
 at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/B=
ase.pm line 366
	ExtUtils::CBuilder::Base::perl_src('ExtUtils::CBuilder=3DHASH(0x847be70)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 374
	ExtUtils::CBuilder::Base::perl_inc('ExtUtils::CBuilder=3DHASH(0x847be70)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 154
	ExtUtils::CBuilder::Base::compile('ExtUtils::CBuilder=3DHASH(0x847be70)', =
'C++', undef, 'source', 'compilet-a2Jh1.c') called at /usr/lib/perl/ptest/d=
ist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 209
	eval {...} called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/E=
xtUtils/CBuilder/Base.pm line 206
	ExtUtils::CBuilder::Base::have_compiler('ExtUtils::CBuilder=3DHASH(0x847be=
70)') called at t/more.t line 36
PASS: dist/ExtUtils-ParseXS/t/more.t
PERL_CORE is set but I can't find your perl source!
 at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/B=
ase.pm line 366
	ExtUtils::CBuilder::Base::perl_src('ExtUtils::CBuilder=3DHASH(0x8456db0)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 374
	ExtUtils::CBuilder::Base::perl_inc('ExtUtils::CBuilder=3DHASH(0x8456db0)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 154
	ExtUtils::CBuilder::Base::compile('ExtUtils::CBuilder=3DHASH(0x8456db0)', =
'C++', undef, 'source', 'compilet-72wnu.c') called at /usr/lib/perl/ptest/d=
ist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 209
	eval {...} called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/E=
xtUtils/CBuilder/Base.pm line 206
	ExtUtils::CBuilder::Base::have_compiler('ExtUtils::CBuilder=3DHASH(0x8456d=
b0)') called at t/usage.t line 39
PASS: dist/ExtUtils-ParseXS/t/usage.t
# lib is not a directory.
# lib/File/CheckTree.pm is not a plain file.
# /usr/lib/perl/ptest/dist/File-CheckTree/lib/File/CheckTree.pm does not ex=
ist.
#   Failed test at t/CheckTree.t line 42.
#          got: '3'
#     expected: '0'
FAIL: dist/File-CheckTree/t/CheckTree.t
FAILED at test 2
PASS: dist/Filter-Simple/t/data.t
PASS: dist/Filter-Simple/t/export.t
PASS: dist/Filter-Simple/t/filter_only.t
PASS: dist/Filter-Simple/t/filter.t
PASS: dist/Filter-Simple/t/import.t
PASS: dist/I18N-Collate/t/I18N-Collate.t
PASS: dist/I18N-LangTags/t/01_about_verbose.t
PASS: dist/I18N-LangTags/t/05_main.t
PASS: dist/I18N-LangTags/t/07_listy.t
PASS: dist/I18N-LangTags/t/10_http.t
PASS: dist/I18N-LangTags/t/20_locales.t
PASS: dist/I18N-LangTags/t/50_super.t
PASS: dist/I18N-LangTags/t/55_supers_strict.t
PASS: dist/I18N-LangTags/t/80_all_env.t
PASS: dist/if/t/if.t
PASS: dist/IO/t/io_const.t
PASS: dist/IO/t/io_dir.t
PASS: dist/IO/t/io_dup.t
PASS: dist/IO/t/io_file_export.t
PASS: dist/IO/t/io_file.t
PASS: dist/IO/t/io_linenum.t
PASS: dist/IO/t/io_multihomed.t
PASS: dist/IO/t/io_pipe.t
PASS: dist/IO/t/io_poll.t
PASS: dist/IO/t/io_sel.t
PASS: dist/IO/t/io_sock.t
PASS: dist/IO/t/IO.t
PASS: dist/IO/t/io_taint.t
Can't open Makefile.PL at t/io_tell.t line 20.
FAIL: dist/IO/t/io_tell.t
FAILED--expected 13 tests, saw 0
PASS: dist/IO/t/io_udp.t
PASS: dist/IO/t/io_unix.t
PASS: dist/IO/t/io_utf8.t
PASS: dist/IO/t/io_xs.t
PASS: dist/lib/t/01lib.t
PASS: dist/Locale-Maketext/t/01_about_verbose.t
PASS: dist/Locale-Maketext/t/04_use_external_lex_cache.t
PASS: dist/Locale-Maketext/t/09_compile.t
PASS: dist/Locale-Maketext/t/10_make.t
PASS: dist/Locale-Maketext/t/20_get.t
PASS: dist/Locale-Maketext/t/30_eval_dollar_at.t
PASS: dist/Locale-Maketext/t/40_super.t
PASS: dist/Locale-Maketext/t/50_super.t
PASS: dist/Locale-Maketext/t/60_super.t
PASS: dist/Locale-Maketext/t/70_fail_auto.t
PASS: dist/Locale-Maketext/t/90_utf8.t
PASS: dist/Math-BigInt-FastCalc/t/bigintfc.t
PASS: dist/Math-BigInt-FastCalc/t/bootstrap.t
PASS: dist/Math-BigInt-FastCalc/t/leak.t
PASS: dist/Math-BigInt-FastCalc/t/mbi_rand.t
PASS: dist/Math-BigInt/t/bare_mbf.t
PASS: dist/Math-BigInt/t/bare_mbi.t
PASS: dist/Math-BigInt/t/bare_mif.t
PASS: dist/Math-BigInt/t/bigfltpm.t
PASS: dist/Math-BigInt/t/bigintc.t
PASS: dist/Math-BigInt/t/bigintpm.t
PASS: dist/Math-BigInt/t/bigints.t
PASS: dist/Math-BigInt/t/biglog.t
PASS: dist/Math-BigInt/t/big_pi_e.t
PASS: dist/Math-BigInt/t/bigroot.t
PASS: dist/Math-BigInt/t/calling.t
PASS: dist/Math-BigInt/t/config.t
PASS: dist/Math-BigInt/t/constant.t
PASS: dist/Math-BigInt/t/const_mbf.t
PASS: dist/Math-BigInt/t/downgrade.t
PASS: dist/Math-BigInt/t/_e_math.t
PASS: dist/Math-BigInt/t/inf_nan.t
PASS: dist/Math-BigInt/t/isa.t
PASS: dist/Math-BigInt/t/lib_load.t
PASS: dist/Math-BigInt/t/mbf_ali.t
PASS: dist/Math-BigInt/t/mbi_ali.t
PASS: dist/Math-BigInt/t/mbimbf.t
PASS: dist/Math-BigInt/t/mbi_rand.t
PASS: dist/Math-BigInt/t/nan_cmp.t
PASS: dist/Math-BigInt/t/new_overloaded.t
PASS: dist/Math-BigInt/t/req_mbf0.t
PASS: dist/Math-BigInt/t/req_mbf1.t
PASS: dist/Math-BigInt/t/req_mbfa.t
PASS: dist/Math-BigInt/t/req_mbfi.t
PASS: dist/Math-BigInt/t/req_mbfn.t
PASS: dist/Math-BigInt/t/req_mbfw.t
PASS: dist/Math-BigInt/t/require.t
PASS: dist/Math-BigInt/t/round.t
PASS: dist/Math-BigInt/t/sub_ali.t
PASS: dist/Math-BigInt/t/sub_mbf.t
PASS: dist/Math-BigInt/t/sub_mbi.t
PASS: dist/Math-BigInt/t/sub_mif.t
PASS: dist/Math-BigInt/t/trap.t
PASS: dist/Math-BigInt/t/upgrade2.t
PASS: dist/Math-BigInt/t/upgradef.t
PASS: dist/Math-BigInt/t/upgrade.t
PASS: dist/Math-BigInt/t/use_lib1.t
PASS: dist/Math-BigInt/t/use_lib2.t
PASS: dist/Math-BigInt/t/use_lib3.t
PASS: dist/Math-BigInt/t/use_lib4.t
PASS: dist/Math-BigInt/t/use_mbfw.t
PASS: dist/Math-BigInt/t/use.t
PASS: dist/Math-BigInt/t/with_sub.t
PASS: dist/Math-BigRat/t/big_ap.t
PASS: dist/Math-BigRat/t/bigfltrt.t
PASS: dist/Math-BigRat/t/biglog.t
PASS: dist/Math-BigRat/t/bigratpm.t
PASS: dist/Math-BigRat/t/bigrat.t
PASS: dist/Math-BigRat/t/bigratup.t
PASS: dist/Math-BigRat/t/bigroot.t
PASS: dist/Math-BigRat/t/bitwise.t
PASS: dist/Math-BigRat/t/hang.t
PASS: dist/Math-BigRat/t/requirer.t
PASS: dist/Math-BigRat/t/trap.t
PASS: dist/Module-CoreList/t/corelist.t
PASS: dist/Module-CoreList/t/deprecated.t
PASS: dist/Module-CoreList/t/find_modules.t
SKIP: dist/Module-CoreList/t/pod.t
PASS: dist/Net-Ping/t/100_load.t
PASS: dist/Net-Ping/t/110_icmp_inst.t
PASS: dist/Net-Ping/t/120_udp_inst.t
PASS: dist/Net-Ping/t/130_tcp_inst.t
PASS: dist/Net-Ping/t/140_stream_inst.t
PASS: dist/Net-Ping/t/150_syn_inst.t
SKIP: dist/Net-Ping/t/190_alarm.t
SKIP: dist/Net-Ping/t/200_ping_tcp.t
SKIP: dist/Net-Ping/t/250_ping_hires.t
SKIP: dist/Net-Ping/t/300_ping_stream.t
SKIP: dist/Net-Ping/t/400_ping_syn.t
SKIP: dist/Net-Ping/t/410_syn_host.t
PASS: dist/Net-Ping/t/450_service.t
PASS: dist/Net-Ping/t/500_ping_icmp.t
PASS: dist/Net-Ping/t/510_ping_udp.t
PASS: dist/Pod-Perldoc/t/01_about_verbose.t
PASS: dist/Pod-Perldoc/t/checkerbasic.t
PASS: dist/Pod-Perldoc/t/perldocbasic.t
PASS: dist/Pod-Perldoc/t/textbasic.t
PASS: dist/Safe/t/safe1.t
PASS: dist/Safe/t/safe2.t
PASS: dist/Safe/t/safe3.t
PASS: dist/Safe/t/safeload.t
Can't open opcodes: No such file or directory at t/safeops.t line 31, <DATA=
> line 360.
FAIL: dist/Safe/t/safeops.t
FAILED--no leader found
PASS: dist/Safe/t/safesort.t
PASS: dist/Safe/t/safeuniversal.t
PASS: dist/Safe/t/safeutf8.t
PASS: dist/Safe/t/safewrap.t
PASS: dist/SelfLoader/t/01SelfLoader.t
PASS: dist/SelfLoader/t/02SelfLoader-buggy.t
PASS: dist/SelfLoader/t/03taint.t
PASS: dist/Storable/t/attach_errors.t
PASS: dist/Storable/t/attach_singleton.t
PASS: dist/Storable/t/blessed.t
PASS: dist/Storable/t/canonical.t
PASS: dist/Storable/t/circular_hook.t
PASS: dist/Storable/t/code.t
PASS: dist/Storable/t/compat01.t
PASS: dist/Storable/t/compat06.t
PASS: dist/Storable/t/croak.t
PASS: dist/Storable/t/dclone.t
PASS: dist/Storable/t/downgrade.t
PASS: dist/Storable/t/file_magic.t
PASS: dist/Storable/t/forgive.t
PASS: dist/Storable/t/freeze.t
PASS: dist/Storable/t/integer.t
SKIP: dist/Storable/t/interwork56.t
PASS: dist/Storable/t/just_plain_nasty.t
PASS: dist/Storable/t/lock.t
PASS: dist/Storable/t/malice.t
PASS: dist/Storable/t/overload.t
PASS: dist/Storable/t/recurse.t
PASS: dist/Storable/t/restrict.t
PASS: dist/Storable/t/retrieve.t
PASS: dist/Storable/t/sig_die.t
PASS: dist/Storable/t/store.t
PASS: dist/Storable/t/threads.t
PASS: dist/Storable/t/tied_hook.t
PASS: dist/Storable/t/tied_items.t
PASS: dist/Storable/t/tied.t
PASS: dist/Storable/t/utf8hash.t
PASS: dist/Storable/t/utf8.t
PASS: dist/Storable/t/weak.t
PASS: dist/Thread-Queue/t/01_basic.t
PASS: dist/Thread-Queue/t/02_refs.t
PASS: dist/Thread-Queue/t/03_peek.t
PASS: dist/Thread-Queue/t/04_errs.t
PASS: dist/Thread-Queue/t/05_extract.t
PASS: dist/Thread-Queue/t/06_insert.t
PASS: dist/Thread-Queue/t/07_lock.t
PASS: dist/Thread-Queue/t/08_nothreads.t
PASS: dist/Thread-Semaphore/t/01_basic.t
PASS: dist/Thread-Semaphore/t/02_errs.t
PASS: dist/Thread-Semaphore/t/03_nothreads.t
PASS: dist/Thread-Semaphore/t/04_nonblocking.t
PASS: dist/Thread-Semaphore/t/05_force.t
PASS: dist/threads-shared/t/0nothread.t
PASS: dist/threads-shared/t/av_refs.t
PASS: dist/threads-shared/t/av_simple.t
PASS: dist/threads-shared/t/blessed.t
PASS: dist/threads-shared/t/clone.t
PASS: dist/threads-shared/t/cond.t
PASS: dist/threads-shared/t/disabled.t
PASS: dist/threads-shared/t/hv_refs.t
PASS: dist/threads-shared/t/hv_simple.t
PASS: dist/threads-shared/t/no_share.t
PASS: dist/threads-shared/t/object.t
PASS: dist/threads-shared/t/shared_attr.t
PASS: dist/threads-shared/t/stress.t
PASS: dist/threads-shared/t/sv_refs.t
PASS: dist/threads-shared/t/sv_simple.t
PASS: dist/threads-shared/t/utf8.t
PASS: dist/threads-shared/t/waithires.t
PASS: dist/threads-shared/t/wait.t
PASS: dist/threads/t/basic.t
PASS: dist/threads/t/blocks.t
PASS: dist/threads/t/context.t
PASS: dist/threads/t/end.t
PASS: dist/threads/t/err.t
PASS: dist/threads/t/exit.t
PASS: dist/threads/t/free2.t
PASS: dist/threads/t/free.t
PASS: dist/threads/t/join.t
PASS: dist/threads/t/kill2.t
PASS: dist/threads/t/kill.t
PASS: dist/threads/t/libc.t
PASS: dist/threads/t/list.t
SKIP: dist/threads/t/no_threads.t
PASS: dist/threads/t/problems.t
PASS: dist/threads/t/stack_env.t
PASS: dist/threads/t/stack.t
PASS: dist/threads/t/state.t
PASS: dist/threads/t/stress_cv.t
PASS: dist/threads/t/stress_re.t
PASS: dist/threads/t/stress_string.t
PASS: dist/threads/t/thread.t
PASS: dist/XSLoader/t/XSLoader.t
PASS: ext/B/t/b.t
PASS: ext/B/t/concise.t
PASS: ext/B/t/concise-xs.t
PASS: ext/B/t/f_map.t
PASS: ext/B/t/f_sort.t
PASS: ext/B/t/optree_check.t
PASS: ext/B/t/optree_concise.t
PASS: ext/B/t/optree_constants.t
PASS: ext/B/t/optree_misc.t
PASS: ext/B/t/optree_samples.t
PASS: ext/B/t/optree_sort.t
PASS: ext/B/t/optree_specials.t
PASS: ext/B/t/optree_varinit.t
PASS: ext/B/t/o.t
PASS: ext/B/t/pragma.t
PASS: ext/B/t/showlex.t
PASS: ext/B/t/terse.t
PASS: ext/B/t/walkoptree.t
PASS: ext/B/t/xref.t
PASS: ext/Devel-Peek/t/Peek.t
#   Failed test 'array should contain one result result or more: libc =3D> =
()'
#   at t/DynaLoader.t line 115.
#     '0'
#         >=3D
#     '1'
FAIL: ext/DynaLoader/t/DynaLoader.t
FAILED at test 20
PASS: ext/Errno/t/Errno.t
PASS: ext/Fcntl/t/autoload.t
PASS: ext/Fcntl/t/fcntl.t
PASS: ext/Fcntl/t/mode.t
#   Failed test 'can't find perl: expected ../../perl'
#   at t/syslfs.t line 116.
FAIL: ext/Fcntl/t/syslfs.t
FAILED at test 1
PASS: ext/FileCache/t/01open.t
PASS: ext/FileCache/t/02maxopen.t
PASS: ext/FileCache/t/03append.t
PASS: ext/FileCache/t/04twoarg.t
PASS: ext/FileCache/t/05override.t
PASS: ext/FileCache/t/06export.t
PASS: ext/FileCache/t/07noimport.t
PASS: ext/File-Glob/t/basic.t
PASS: ext/File-Glob/t/case.t
PASS: ext/File-Glob/t/global.t
PASS: ext/File-Glob/t/taint.t
PASS: ext/GDBM_File/t/gdbm.t
PASS: ext/Hash-Util-FieldHash/t/01_load.t
PASS: ext/Hash-Util-FieldHash/t/02_function.t
PASS: ext/Hash-Util-FieldHash/t/03_class.t
PASS: ext/Hash-Util-FieldHash/t/04_thread.t
PASS: ext/Hash-Util-FieldHash/t/05_perlhook.t
PASS: ext/Hash-Util-FieldHash/t/10_hash.t
PASS: ext/Hash-Util-FieldHash/t/11_hashassign.t
PASS: ext/Hash-Util-FieldHash/t/12_hashwarn.t
PASS: ext/Hash-Util/t/Util.t
PASS: ext/I18N-Langinfo/t/Langinfo.t
PASS: ext/IPC-Open2/t/IPC-Open2.t
# Failed at t/fd.t line 33
#      got "No such file or directory at -e line 1.\n"
# expected ""
FAIL: ext/IPC-Open3/t/fd.t
FAILED at test 2
PASS: ext/IPC-Open3/t/IPC-Open3.t
PASS: ext/Opcode/t/Opcode.t
PASS: ext/Opcode/t/ops.t
PASS: ext/PerlIO-encoding/t/encoding.t
PASS: ext/PerlIO-encoding/t/fallback.t
PASS: ext/PerlIO-encoding/t/nolooping.t
PASS: ext/PerlIO-scalar/t/scalar.t
PASS: ext/PerlIO-scalar/t/scalar_ungetc.t
PASS: ext/PerlIO-via/t/via.t
PASS: ext/Pod-Html/t/htmlescp.t
PASS: ext/Pod-Html/t/htmllink.t
PASS: ext/Pod-Html/t/htmlview.t
PASS: ext/POSIX/t/is.t
PASS: ext/POSIX/t/math.t
#   Failed test 'O_RDONLY with open'
#   at t/posix.t line 55.
FAIL: ext/POSIX/t/posix.t
FAILED at test 1
PASS: ext/POSIX/t/sigaction.t
PASS: ext/POSIX/t/sysconf.t
Use of uninitialized value $testfd in numeric gt (>) at t/taint.t line 40.
#   Failed test '    read'
#   at t/taint.t line 41.
#          got: undef
#     expected: '#d'
FAIL: ext/POSIX/t/taint.t
FAILED at test 4
PASS: ext/POSIX/t/termios.t
PASS: ext/POSIX/t/time.t
PASS: ext/POSIX/t/waitpid.t
PASS: ext/re/t/lexical_debug.t
PASS: ext/re/t/qr.t
PASS: ext/re/t/reflags.t
PASS: ext/re/t/re_funcs.t
PASS: ext/re/t/re_funcs_u.t
PASS: ext/re/t/regop.t
PASS: ext/re/t/re.t
PASS: ext/SDBM_File/t/sdbm.t
PASS: ext/Socket/t/getaddrinfo.t
PASS: ext/Socket/t/getnameinfo.t
PASS: ext/Socket/t/socketpair.t
PASS: ext/Socket/t/Socket.t
PASS: ext/Sys-Hostname/t/Hostname.t
PASS: ext/Tie-Hash-NamedCapture/t/tiehash.t
#   Failed test at t/Tie-Memoize.t line 35.
Use of uninitialized value in string eq at t/Tie-Memoize.t line 36.
Use of uninitialized value $c in string eq at t/Tie-Memoize.t line 36.
FAIL: ext/Tie-Memoize/t/Tie-Memoize.t
FAILED at test 11
PASS: ext/XS-APItest/t/arrayexpr.t
PASS: ext/XS-APItest/t/blockasexpr.t
PASS: ext/XS-APItest/t/blockhooks-csc.t
PASS: ext/XS-APItest/t/blockhooks.t
PASS: ext/XS-APItest/t/call_checker.t
PASS: ext/XS-APItest/t/caller.t
PASS: ext/XS-APItest/t/call.t
PASS: ext/XS-APItest/t/cleanup.t
PASS: ext/XS-APItest/t/cophh.t
PASS: ext/XS-APItest/t/copyhints.t
PASS: ext/XS-APItest/t/customop.t
PASS: ext/XS-APItest/t/eval-filter.t
PASS: ext/XS-APItest/t/exception.t
PASS: ext/XS-APItest/t/grok.t
PASS: ext/XS-APItest/t/hash.t
PASS: ext/XS-APItest/t/keyword_multiline.t
PASS: ext/XS-APItest/t/keyword_plugin.t
PASS: ext/XS-APItest/t/labelconst.t
PASS: ext/XS-APItest/t/loopblock.t
PASS: ext/XS-APItest/t/looprest.t
PASS: ext/XS-APItest/t/magic_chain.t
PASS: ext/XS-APItest/t/magic.t
PASS: ext/XS-APItest/t/multicall.t
PASS: ext/XS-APItest/t/my_cxt.t
PASS: ext/XS-APItest/t/my_exit.t
PASS: ext/XS-APItest/t/op_contextualize.t
PASS: ext/XS-APItest/t/op_list.t
PASS: ext/XS-APItest/t/op.t
PASS: ext/XS-APItest/t/overload.t
PASS: ext/XS-APItest/t/peep.t
PASS: ext/XS-APItest/t/pmflag.t
PASS: ext/XS-APItest/t/postinc.t
PASS: ext/XS-APItest/t/printf.t
PASS: ext/XS-APItest/t/ptr_table.t
PASS: ext/XS-APItest/t/push.t
PASS: ext/XS-APItest/t/refs.t
PASS: ext/XS-APItest/t/rmagical.t
PASS: ext/XS-APItest/t/rv2cv_op_cv.t
PASS: ext/XS-APItest/t/savehints.t
PASS: ext/XS-APItest/t/scopelessblock.t
PASS: ext/XS-APItest/t/stmtasexpr.t
PASS: ext/XS-APItest/t/stmtsasexpr.t
PASS: ext/XS-APItest/t/stuff_modify_bug.t
PASS: ext/XS-APItest/t/stuff_svcur_bug.t
PASS: ext/XS-APItest/t/svpeek.t
PASS: ext/XS-APItest/t/svpv_magic.t
PASS: ext/XS-APItest/t/svsetsv.t
PASS: ext/XS-APItest/t/swaplabel.t
PASS: ext/XS-APItest/t/swaptwostmts.t
PASS: ext/XS-APItest/t/temp_lv_sub.t
PASS: ext/XS-APItest/t/utf16_to_utf8.t
PASS: ext/XS-APItest/t/utf8.t
PASS: ext/XS-APItest/t/xs_special_subs_require.t
PASS: ext/XS-APItest/t/xs_special_subs.t
PASS: ext/XS-APItest/t/xsub_h.t
PASS: ext/XS-Typemap/t/Typemap.t
PASS: lib/AnyDBM_File.t
PASS: lib/Benchmark.t
PASS: lib/bigfloatpl.t
PASS: lib/bigintpl.t
PASS: lib/blib.t
PASS: lib/bytes.t
PASS: lib/Carp.t
Can't open ../../lib/unicore/UnicodeData.txt: No such file or directory at =
../lib/charnames.t line 911.
FAIL: lib/charnames.t
FAILED--non-zero wait status: 512
PASS: lib/Class/Struct.t
#   Failed test '\ was built'
#   at ../lib/Config/Extensions.t line 26.
#                   'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper=
 Devel/DProf Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl Fil=
e/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/=
SysV List/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encodin=
g PerlIO/scalar PerlIO/via GDBM_File SDBM_File Socket Storable Sys/Hostname=
 Sys/Syslog Text/Soundex Time/HiRes Time/Piece Unicode/Normalize XS/APItest=
 XS/APItest/KeywordRPN XS/Typemap attributes mro re threads threads/shared =
Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/Debug B/Deparse=
 B/Lint CGI CPAN CPANPLUS CPANPLUS/Dist/Build Class/ISA Devel/SelfStubber D=
igest Errno ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/I=
nstall ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/ParseXS File/Fetch Fil=
e/Path File/Temp FileCache Filter/Simple Getopt/Long I18N/LangTags IO/Compr=
ess IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 Locale/Codes Locale/Maketext Locale=
/Maketext/Simple Log/Message Log/Message/Simple Math/BigInt Math/BigRat Mat=
h/Complex Memoize Module/Build Module/CoreList Module/Load Module/Load/Cond=
itional Module/Loaded Module/Pluggable NEXT Net/Ping Object/Accessor Packag=
e/Constants Params/Check Parse/CPAN/Meta PerlIO/via/QuotedPrint Pod/Escapes=
 Pod/LaTeX Pod/Parser Pod/Perldoc Pod/Plainer Pod/Simple Safe SelfLoader Sh=
ell Switch Term/ANSIColor Term/Cap Term/UI Test Test/Harness Test/Simple Te=
xt/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/Fil=
e Tie/Memoize Tie/RefHash Time/Local Unicode/Collate XSLoader autodie autou=
se base bignum constant encoding/warnings if lib libnet parent podlators'
#     doesn't match '(?^:\b\\\b)'
FAIL: lib/Config/Extensions.t
FAILED at test 43
PASS: lib/Config.t
PASS: lib/DBM_Filter/t/01error.t
PASS: lib/DBM_Filter/t/02core.t
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/compress.t line 15.
# Looks like you planned 23 tests but ran 4.
# Looks like your test exited with 2 just after 4.
FAIL: lib/DBM_Filter/t/compress.t
FAILED--expected 23 tests, saw 4
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/encode.t line 19.
# Looks like you planned 26 tests but ran 4.
# Looks like your test exited with 2 just after 4.
FAIL: lib/DBM_Filter/t/encode.t
FAILED--expected 26 tests, saw 4
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/int32.t line 6.
# Looks like you planned 22 tests but ran 3.
# Looks like your test exited with 2 just after 3.
FAIL: lib/DBM_Filter/t/int32.t
FAILED--expected 22 tests, saw 3
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/null.t line 6.
# Looks like you planned 26 tests but ran 3.
# Looks like your test exited with 2 just after 3.
FAIL: lib/DBM_Filter/t/null.t
FAILED--expected 26 tests, saw 3
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/utf8.t line 17.
# Looks like you planned 20 tests but ran 4.
# Looks like your test exited with 2 just after 4.
FAIL: lib/DBM_Filter/t/utf8.t
FAILED--expected 20 tests, saw 4
PASS: lib/DB.t
Can't locate Test/More.pm in @INC (@INC contains: lib) at ../lib/diagnostic=
s.t line 8.
BEGIN failed--compilation aborted at ../lib/diagnostics.t line 8.
FAIL: lib/diagnostics.t
FAILED--no leader found
PASS: lib/DirHandle.t
PASS: lib/dumpvar.t
PASS: lib/English.t
PASS: lib/Exporter.t
FAIL: lib/ExtUtils/t/Embed.t
FAILED at test 1
PASS: lib/feature.t
PASS: lib/feature/unicode_strings.t
PASS: lib/File/Basename.t
PASS: lib/File/Compare.t
PASS: lib/File/Copy.t
PASS: lib/File/DosGlob.t
PASS: lib/File/Find/t/find.t
PASS: lib/File/Find/t/taint.t
PASS: lib/FileHandle.t
PASS: lib/File/stat.t
PASS: lib/filetest.t
FAIL: lib/FindBin.t
FAILED at test 1
PASS: lib/Getopt/Std.t
SKIP: lib/h2ph.t
SKIP: lib/h2xs.t
PASS: lib/integer.t
PASS: lib/Internals.t
PASS: lib/less.t
PASS: lib/locale.t
PASS: lib/Net/hostent.t
SKIP: lib/Net/netent.t
PASS: lib/Net/protoent.t
PASS: lib/Net/servent.t
PASS: lib/open.t
SKIP: lib/overload64.t
PASS: lib/overloading.t
PASS: lib/overload.t
Can't open perl script "../lib/perl5db/t/eval-line-bug": No such file or di=
rectory
No such file or directory at ../lib/perl5db.t line 71.
# Looks like you planned 9 tests but ran 0.
FAIL: lib/perl5db.t
FAILED--expected 9 tests, saw 0
PASS: lib/Pod/t/eol.t
PASS: lib/Pod/t/Functions.t
PASS: lib/Pod/t/InputObjects.t
PASS: lib/Pod/t/Select.t
PASS: lib/Pod/t/Usage.t
PASS: lib/Pod/t/utils.t
PASS: lib/Search/Dict.t
PASS: lib/SelectSaver.t
PASS: lib/sigtrap.t
PASS: lib/sort.t
PASS: lib/strict.t
PASS: lib/subs.t
PASS: lib/Symbol.t
PASS: lib/Term/Complete.t
PASS: lib/Term/ReadLine.t
PASS: lib/Text/Abbrev.t
PASS: lib/Thread.t
PASS: lib/Tie/Array/push.t
PASS: lib/Tie/Array/splice.t
PASS: lib/Tie/Array/stdpush.t
PASS: lib/Tie/Array/std.t
PASS: lib/Tie/ExtraHash.t
PASS: lib/Tie/Handle/stdhandle_from_handle.t
PASS: lib/Tie/Handle/stdhandle.t
PASS: lib/Tie/Hash.t
PASS: lib/Tie/Scalar.t
PASS: lib/Tie/SubstrHash.t
PASS: lib/Time/gmtime.t
PASS: lib/Time/localtime.t
PASS: lib/Unicode/UCD.t
PASS: lib/User/grent.t
PASS: lib/User/pwent.t
PASS: lib/utf8.t
PASS: lib/vars_carp.t
PASS: lib/vars.t
PASS: lib/version.t
PASS: lib/vmsish.t
PASS: lib/warnings.t
Can't open perl script "./psed": No such file or directory
# Failed at x2p/s2p.t line 852
#      got ""
# expected "1\nline 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\n8\nl=
ine 8\n"
Can't open perl script "../x2p/s2p": No such file or directory
# Failed at x2p/s2p.t line 864
#      got ""
# expected "1\nline 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\n8\nl=
ine 8\n"
FAIL: t/x2p/s2p.t
FAILED at test 1
Can't locate FindExt.pm in @INC (@INC contains: ../win32 ../lib) at porting=
/FindExt.t line 27.
BEGIN failed--compilation aborted at porting/FindExt.t line 27.
FAIL: t/porting/FindExt.t
FAILED--no leader found
Can't open ../proto.h: No such file or directory at porting/args_assert.t l=
ine 26.
FAIL: t/porting/args_assert.t
FAILED--non-zero wait status: 512
SKIP: t/porting/authors.t
PASS: t/porting/bincompat.t
Can't open perl script "pod/buildtoc": No such file or directory
FAIL: t/porting/buildtoc.t
FAILED--no leader found
PASS: t/porting/checkcase.t
Can't locate Maintainers.pm in @INC (@INC contains: lib Porting ../lib .) a=
t porting/cmp_version.t line 26.
BEGIN failed--compilation aborted at porting/cmp_version.t line 26.
FAIL: t/porting/cmp_version.t
FAILED--no leader found
Can't open embed.fnc: No such file or directory at porting/diag.t line 24.
FAIL: t/porting/diag.t
FAILED--non-zero wait status: 512
# Failed at porting/dual-life.t line 58
# Failed at porting/dual-life.t line 58
FAIL: t/porting/dual-life.t
FAILED at test 1
Can't open ../Porting/exec-bit.txt: No such file or directory at porting/ex=
ec-bit.t line 32.
# Failed at porting/exec-bit.t line 42
# Remove the exec bit or add '../cpan/Test-Harness/t/source_tests/source.sh=
' to Porting/exec-bit.txt
# Failed at porting/exec-bit.t line 42
# Remove the exec bit or add '../cpan/Test-Harness/t/source_tests/source_ar=
gs.sh' to Porting/exec-bit.txt
# Failed at porting/exec-bit.t line 42
# Remove the exec bit or add '../t/TEST' to Porting/exec-bit.txt
FAIL: t/porting/exec-bit.t
FAILED at test 1
PASS: t/porting/filenames.t
Can't locate Maintainers.pm in @INC (@INC contains: lib Porting) at porting=
/maintainers.t line 18.
BEGIN failed--compilation aborted at porting/maintainers.t line 18.
FAIL: t/porting/maintainers.t
FAILED--no leader found
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
FAIL: t/porting/manifest.t
FAILED at test 2
Can't open NetWare/splittree.pl for reading: No such file or directory
 at porting/podcheck.t line 53
# Looks like you planned 631 tests but ran 0.
FAIL: t/porting/podcheck.t
FAILED--expected 631 tests, saw 0
Can't locate regen/regen_lib.pl in @INC (@INC contains: lib ../lib .) at po=
rting/regen.t line 22.
FAIL: t/porting/regen.t
FAILED--no leader found
PASS: t/porting/test_bootstrap.t
Failed 168 tests out of 1929, 91.29% okay.
	../cpan/Archive-Extract/t/01_Archive-Extract.t
	../cpan/CPANPLUS-Dist-Build/t/02_CPANPLUS-Dist-Build.t
	../cpan/CPANPLUS/t/04_CPANPLUS-Module.t
	../cpan/CPANPLUS/t/20_CPANPLUS-Dist-MM.t
	../cpan/Devel-DProf/t/DProf.t
	../cpan/Digest-SHA/t/allfcns.t
	../cpan/Digest-SHA/t/base64.t
	../cpan/Digest-SHA/t/bitbuf.t
	../cpan/Digest-SHA/t/dumpload.t
	../cpan/Digest-SHA/t/fips180-4.t
	../cpan/Digest-SHA/t/fips198.t
	../cpan/Digest-SHA/t/gg.t
	../cpan/Digest-SHA/t/gglong.t
	../cpan/Digest-SHA/t/hmacsha.t
	../cpan/Digest-SHA/t/ireland.t
	../cpan/Digest-SHA/t/methods.t
	../cpan/Digest-SHA/t/nistbit.t
	../cpan/Digest-SHA/t/nistbyte.t
	../cpan/Digest-SHA/t/rfc2202.t
	../cpan/Digest-SHA/t/sha1.t
	../cpan/Digest-SHA/t/sha224.t
	../cpan/Digest-SHA/t/sha256.t
	../cpan/Digest-SHA/t/sha384.t
	../cpan/Digest-SHA/t/sha512.t
	../cpan/Digest-SHA/t/woodbury.t
	../cpan/ExtUtils-Constant/t/Constant.t
	../cpan/ExtUtils-MakeMaker/t/00compile.t
	../cpan/ExtUtils-MakeMaker/t/INST.t
	../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
	../cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
	../cpan/ExtUtils-MakeMaker/t/PL_FILES.t
	../cpan/ExtUtils-MakeMaker/t/basic.t
	../cpan/ExtUtils-MakeMaker/t/min_perl_version.t
	../cpan/ExtUtils-MakeMaker/t/miniperl.t
	../cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
	../cpan/ExtUtils-MakeMaker/t/postamble.t
	../cpan/ExtUtils-MakeMaker/t/recurs.t
	../cpan/ExtUtils-MakeMaker/t/several_authors.t
	../cpan/ExtUtils-MakeMaker/t/writemakefile_args.t
	../cpan/Filter-Util-Call/t/call.t
	../cpan/IO-Compress/t/010examples-bzip2.t
	../cpan/IO-Compress/t/010examples-zlib.t
	../cpan/IO-Compress/t/cz-05examples.t
	../cpan/List-Util/t/00version.t
	../cpan/List-Util/t/blessed.t
	../cpan/List-Util/t/dualvar.t
	../cpan/List-Util/t/expfail.t
	../cpan/List-Util/t/first.t
	../cpan/List-Util/t/isvstring.t
	../cpan/List-Util/t/lln.t
	../cpan/List-Util/t/max.t
	../cpan/List-Util/t/maxstr.t
	../cpan/List-Util/t/min.t
	../cpan/List-Util/t/minstr.t
	../cpan/List-Util/t/openhan.t
	../cpan/List-Util/t/p_00version.t
	../cpan/List-Util/t/p_blessed.t
	../cpan/List-Util/t/p_first.t
	../cpan/List-Util/t/p_lln.t
	../cpan/List-Util/t/p_max.t
	../cpan/List-Util/t/p_maxstr.t
	../cpan/List-Util/t/p_min.t
	../cpan/List-Util/t/p_minstr.t
	../cpan/List-Util/t/p_openhan.t
	../cpan/List-Util/t/p_readonly.t
	../cpan/List-Util/t/p_reduce.t
	../cpan/List-Util/t/p_refaddr.t
	../cpan/List-Util/t/p_reftype.t
	../cpan/List-Util/t/p_shuffle.t
	../cpan/List-Util/t/p_sum.t
	../cpan/List-Util/t/p_tainted.t
	../cpan/List-Util/t/proto.t
	../cpan/List-Util/t/readonly.t
	../cpan/List-Util/t/reduce.t
	../cpan/List-Util/t/refaddr.t
	../cpan/List-Util/t/reftype.t
	../cpan/List-Util/t/shuffle.t
	../cpan/List-Util/t/stack-corruption.t
	../cpan/List-Util/t/sum.t
	../cpan/List-Util/t/tainted.t
	../cpan/List-Util/t/weak.t
	../cpan/Module-Build/t/00-compile.t
	../cpan/Module-Build/t/PL_files.t
	../cpan/Module-Build/t/actions/installdeps.t
	../cpan/Module-Build/t/actions/manifest_skip.t
	../cpan/Module-Build/t/add_property.t
	../cpan/Module-Build/t/basic.t
	../cpan/Module-Build/t/bundle_inc.t
	../cpan/Module-Build/t/compat.t
	../cpan/Module-Build/t/compat/exit.t
	../cpan/Module-Build/t/debug.t
	../cpan/Module-Build/t/destinations.t
	../cpan/Module-Build/t/ext.t
	../cpan/Module-Build/t/extend.t
	../cpan/Module-Build/t/files.t
	../cpan/Module-Build/t/help.t
	../cpan/Module-Build/t/install.t
	../cpan/Module-Build/t/install_extra_target.t
	../cpan/Module-Build/t/manifypods.t
	../cpan/Module-Build/t/metadata.t
	../cpan/Module-Build/t/metadata2.t
	../cpan/Module-Build/t/mymeta.t
	../cpan/Module-Build/t/new_from_context.t
	../cpan/Module-Build/t/notes.t
	../cpan/Module-Build/t/parents.t
	../cpan/Module-Build/t/perl_mb_opt.t
	../cpan/Module-Build/t/ppm.t
	../cpan/Module-Build/t/properties/dist_suffix.t
	../cpan/Module-Build/t/properties/license.t
	../cpan/Module-Build/t/properties/module_name.t
	../cpan/Module-Build/t/properties/needs_compiler.t
	../cpan/Module-Build/t/properties/release_status.t
	../cpan/Module-Build/t/properties/requires.t
	../cpan/Module-Build/t/properties/share_dir.t
	../cpan/Module-Build/t/resume.t
	../cpan/Module-Build/t/runthrough.t
	../cpan/Module-Build/t/sample.t
	../cpan/Module-Build/t/script_dist.t
	../cpan/Module-Build/t/test_file_exts.t
	../cpan/Module-Build/t/test_type.t
	../cpan/Module-Build/t/test_types.t
	../cpan/Module-Build/t/tilde.t
	../cpan/Module-Build/t/use_tap_harness.t
	../cpan/Module-Build/t/versions.t
	../cpan/Module-Build/t/write_default_maniskip.t
	../cpan/Module-Build/t/xs.t
	../cpan/Module-Metadata/t/metadata.t
	../cpan/Pod-Parser/t/pod/find.t
	../cpan/Pod-Parser/t/pod/pod2usage.t
	../cpan/Pod-Parser/t/pod/podselect.t
	../cpan/Test-Harness/t/000-load.t
	../dist/ExtUtils-CBuilder/t/04-base.t
	../dist/ExtUtils-Install/t/InstallWithMM.t
	../dist/File-CheckTree/t/CheckTree.t
	../dist/IO/t/io_tell.t
	../dist/Safe/t/safeops.t
	../ext/DynaLoader/t/DynaLoader.t
	../ext/Fcntl/t/syslfs.t
	../ext/IPC-Open3/t/fd.t
	../ext/POSIX/t/posix.t
	../ext/POSIX/t/taint.t
	../ext/Tie-Memoize/t/Tie-Memoize.t
	../lib/Config/Extensions.t
	../lib/DBM_Filter/t/compress.t
	../lib/DBM_Filter/t/encode.t
	../lib/DBM_Filter/t/int32.t
	../lib/DBM_Filter/t/null.t
	../lib/DBM_Filter/t/utf8.t
	../lib/ExtUtils/t/Embed.t
	../lib/FindBin.t
	../lib/charnames.t
	../lib/diagnostics.t
	../lib/perl5db.t
	op/pack.t
	op/threads.t
	porting/FindExt.t
	porting/args_assert.t
	porting/buildtoc.t
	porting/cmp_version.t
	porting/diag.t
	porting/dual-life.t
	porting/exec-bit.t
	porting/maintainers.t
	porting/manifest.t
	porting/podcheck.t
	porting/regen.t
	run/switches.t
	x2p/s2p.t
### Since not all tests were successful, you may want to run some of
### them individually and examine any diagnostic messages they produce.
### See the INSTALL document's section on "make test".
### You have a good chance to get more information by running
###   ./perl harness
### in the 't' directory since most (>=3D80%) of the tests succeeded.
### You may have to set your dynamic library search path,
### LD_LIBRARY_PATH, to point to the build directory:
###   setenv LD_LIBRARY_PATH `pwd`; cd t; ./perl harness
###   LD_LIBRARY_PATH=3D`pwd`; export LD_LIBRARY_PATH; cd t; ./perl harness
###   export LD_LIBRARY_PATH=3D`pwd`; cd t; ./perl harness
### for csh-style shells, like tcsh; or for traditional/modern
### Bourne-style shells, like bash, ksh, and zsh, respectively.
u=3D66.00  s=3D25.90  cu=3D4139.58  cs=3D263.78  scripts=3D1929  tests=3D41=
8485


